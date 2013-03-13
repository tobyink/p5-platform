#!/usr/bin/env perl

use v5.12;

use aliased "DateTime";
use aliased "JSON";
use aliased "Path::Tiny" => "Path";
use aliased "Path::Iterator::Rule";

sub j { JSON->new->decode( scalar Path->new($_[0])->slurp ) }

sub make_file
{
	my ($f1, $o) = @_;
	
	my $f2 = do
	{
		my $tmp = "$f1";
		$tmp =~ s{ ^Platform-Template         }{ $o->{distribution} }gex;
		$tmp =~ s{ lib/Platform/Template\.pm$ }{ $o->{filename}     }gex;
		Path->new($tmp);
	};
	
	say "  $f1 => $f2";
	
	my $d = $f1->slurp;
	$d =~ s{ Platform::Template }{ $o->{package}      }gex;
	$d =~ s{ Platform-Template  }{ $o->{distribution} }gex;
	$d =~ s{ \#@{[uc]}\#        }{ $o->{$_}           }gex for sort keys %$o;
	$f2->parent->mkpath;
	$f2->spew($d);
}

sub make_dist
{
	say "$_[0]{distribution}";
	make_file(Path->new($_), @_) for Rule->new->file->all("Platform-Template");
	
	my $changes = Path->new($_[0]{platform}.".changes");
	if ($changes->exists)
	{
		say "  Changes";
		$changes->copy($_[0]{distribution}."/Changes");
	}
}

sub make_all
{
	my @config_files = Rule->new->name("*.json")->not_name("DEFAULT.json")->all(".");
	for my $config_file (@config_files)
	{
		my ($platform) = ($config_file =~ m{(\w+)\.json$});
		
		my %o = (
			platform     => $platform,
			filename     => "lib/Platform/$platform.pm",
			package      => "Platform::$platform",
			distribution => "Platform-$platform",
			year         => DateTime->now->year,
			%{ j('DEFAULT.json') },
			%{ j($config_file) },
		);
		
		$o{prettytest} ||= $o{test};
		$o{test} = "\$ENV{PERL_PLATFORM_OVERRIDE}||($o{test})";
		
		make_dist(\%o);
	}
}

make_all();

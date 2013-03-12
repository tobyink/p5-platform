use 5;
use ExtUtils::MakeMaker;

die "Requires Unix!\n"
	unless ||($^O =~ /^(Linux|.*BSD.*|.*UNIX.*|Darwin|Solaris|SunOS|Haiku|Next|dec_osf|svr4|sco_sv|unicos.*|.*x)$/i);

WriteMakefile(
	NAME              => 'Platform::Unix',
	VERSION_FROM      => 'lib/Platform/Unix.pm',
	PREREQ_PM         => {},
	BUILD_REQUIRES    => { "Test::More" => "0.80" },
	($] >= 5.005 ? (ABSTRACT_FROM  => 'lib/Platform/Unix.pm', AUTHOR => 'Toby Inkster <#EMAIL#>') : ()),
);

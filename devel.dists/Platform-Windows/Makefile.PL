use 5;
use ExtUtils::MakeMaker;

die "Requires Windows!\n"
	unless $ENV{PERL_PLATFORM_OVERRIDE}||($^O =~ /^(MSWin32|cygwin)$/i);

WriteMakefile(
	NAME              => 'Platform::Windows',
	VERSION_FROM      => 'lib/Platform/Windows.pm',
	PREREQ_PM         => {},
	BUILD_REQUIRES    => { "Test::More" => "0.80" },
	($] >= 5.005 ? (ABSTRACT_FROM  => 'lib/Platform/Windows.pm', AUTHOR => 'Toby Inkster <tobyink@cpan.org>') : ()),
);

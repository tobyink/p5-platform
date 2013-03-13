use 5;
use ExtUtils::MakeMaker;

die "Requires #PLATFORM#!\n"
	unless #TEST#;

WriteMakefile(
	NAME              => 'Platform::Template',
	VERSION_FROM      => '#FILENAME#',
	PREREQ_PM         => {},
	BUILD_REQUIRES    => { "Test::More" => "0.80" },
	($] >= 5.005 ? (ABSTRACT_FROM  => '#FILENAME#', AUTHOR => '#AUTHOR# <#MAIL#>') : ()),
	LICENSE           => 'perl',
	META_MERGE => {
		resources => {
			license     => 'http://dev.perl.org/licenses/',
			homepage    => 'https://metacpan.org/release/Platform-Template',
			bugtracker  => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Platform-Template',
			repository  => 'https://bitbucket.org/tobyink/p5-platform',
		},
	},
);

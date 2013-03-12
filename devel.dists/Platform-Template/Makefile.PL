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
);

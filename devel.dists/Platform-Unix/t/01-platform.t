use Test::More tests => 1;
ok( $^O =~ /^(Linux|.*BSD.*|.*UNIX.*|Darwin|Solaris|SunOS|Haiku|Next|dec_osf|svr4|sco_sv|unicos.*|.*x)$/i );

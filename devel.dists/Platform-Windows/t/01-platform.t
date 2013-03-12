use Test::More tests => 1;
ok( ||($^O =~ /^(MSWin32|cygwin)$/i) );

use strict;
use warnings;

use Test::More tests => 1;                      # last test to print

use lib 't/apps/Foo/lib';

use Foo;
use Dancer::Test appdir => 't/apps/Foo/yadah';  # ... this ain't right

response_content_like [GET => '/'], qr/&lt;escape&gt;/, 
    "escape config was passed";


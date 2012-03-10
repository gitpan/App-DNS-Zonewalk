use strict;
use warnings;
use Test::More;

use_ok('Net::DNS');

# method raxfr() not supported by Net::DNS::Resolver
is(Net::DNS::Resolver->can('raxfr'), undef, "Net::DNS::Resolver->CANNOT('raxfr')");

# inject method raxfr() into Net::DNS::Resolver
use_ok('App::DNS::Zonewalk');

# method raxfr() now supported by Net::DNS::Resolver
can_ok('Net::DNS::Resolver', 'raxfr');

my $r = new_ok('Net::DNS::Resolver');
$r->raxfr('example.org');
#diag $r->errorstring;
like($r->errorstring, qr/nonauth/, 'check nonauth for example.org');

done_testing(6);

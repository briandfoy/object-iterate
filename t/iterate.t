# $Id$

use Test::More tests => 2;

use Object::Iterate qw(iterate);
use Object::Iterate::Tester;

my $o = Object::Iterate::Tester->new();
isa_ok( $o, 'Object::Iterate::Tester' );

print STDERR "o is @$o\n";

iterate { $_ = "$_$_" } $o;

my @expected = qw( AA BB CC DD EE FF );

print STDERR "o is @$o\n";
print STDERR "expected is @expected\n";

ok( eq_array( $o, \@expected ), "iterate gives the right result" );

# $Id$
BEGIN { $| = 1; print "1..3\n"; }
END   {print "not ok\n" unless $loaded;}

use Object::Iterate;
use Object::Iterate::Tester;
$loaded = 1;
print "ok\n";

eval {
	die "Tester object didn't work!"
		unless Object::Iterate::_check_object( 
			Object::Iterate::Tester->new() );
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval {
	die "Thought anonymous hash would work!"
		if eval{ Object::Iterate::_check_object( {} ) };

	die "Thought anonymous array would work!"
		if eval{ Object::Iterate::_check_object( [] ) };

	die "Thought blessed hash would work!"
		if eval{ Object::Iterate::_check_object( bless {}, 'Foo' ) };

	die "Thought undef would work!"
		if eval{ Object::Iterate::_check_object( undef ) };

	die "Thought empty arg list would work!"
		if eval{ Object::Iterate::_check_object( ) };
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

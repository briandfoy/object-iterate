# $Id$
BEGIN { $| = 1; print "1..4\n"; }

eval{ require Object::Iterate };
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval{ require Object::Iterate::Tester };
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

my $o = undef;

eval {
	$o = Object::Iterate::Tester->new();
	die "Couldn't create an object [$o]"
		unless UNIVERSAL::isa( $o, 'Object::Iterate::Tester' );
	
	die "Object doesn't have more function [$Object::Iterate::More]"
		unless UNIVERSAL::can( $o, $Object::Iterate::More );
	die "Object doesn't have next function [$Object::Iterate::Next]"
		unless UNIVERSAL::can( $o, $Object::Iterate::Next );
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval {
	my $e = $o->$Object::Iterate::Next;
		die "First element is wrong [$e]"
		unless $e eq 'a';
	die "There should be more elements after the first one!"
		unless $o->$Object::Iterate::More;

	$e = $o->$Object::Iterate::Next;
	die "Second element is wrong [$e]"
		unless $e eq 'b';
	die "There should be more elements after the second one!"
		unless $o->$Object::Iterate::More;

	$e = $o->$Object::Iterate::Next;
	die "Third element is wrong [$e]"
		unless $e eq 'c';
	die "There should be more elements after the third one!"
		unless $o->$Object::Iterate::More;

	$e = $o->$Object::Iterate::Next;
	die "Fourth element is wrong [$e]"
		unless $e eq 'd';
	die "There should be more elements after the fourth one!"
		unless $o->$Object::Iterate::More;

	$e = $o->$Object::Iterate::Next;
	die "Fifth element is wrong [$e]"
		unless $e eq 'e';
	die "There should be more elements after the fifth one!"
		unless $o->$Object::Iterate::More;

	$e = $o->$Object::Iterate::Next;
	die "Sixth element is wrong [$e]"
		unless $e eq 'f';
	die "There shouldn't be more elements after the last one!"
		if $o->$Object::Iterate::More;
	
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

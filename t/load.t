# $Id$
BEGIN { $| = 1; print "1..2\n"; }

eval{ require Object::Iterate };
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval{ require Object::Iterate::Tester };
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

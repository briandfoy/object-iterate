# $Id$
BEGIN { $| = 1; print "1..2\n"; }
END   {print "not ok\n" unless $loaded;}

use Object::Iterate qw(iterate);
use Object::Iterate::Tester;
$loaded = 1;
print "ok\n";

eval {
	my $o = Object::Iterate::Tester->new();
		
	iterate { $_ = "$_$_" } $o;
	
	my @expected = qw( AA BB CC DD EE FF );
	
	foreach my $i ( 0 .. $#O )
		{
		die unless $O[$i] eq $expected[$i];
		}
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

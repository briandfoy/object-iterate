# $Id$
BEGIN { $| = 1; print "1..2\n"; }
END   {print "not ok\n" unless $loaded;}

use Object::Iterate qw(imap);
use Object::Iterate::Tester;
$loaded = 1;
print "ok\n";

eval {
	my $o = Object::Iterate::Tester->new();
		
	my @O = imap { uc } $o;
	
	my @expected = qw( A B C D E F );
	
	foreach my $i ( 0 .. $#O )
		{
		die unless $O[$i] eq $expected[$i];
		}
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";


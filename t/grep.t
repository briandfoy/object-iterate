# $Id$
BEGIN { $| = 1; print "1..2\n"; }
END   {print "not ok\n" unless $loaded;}

use Object::Iterate qw(igrep);
use Object::Iterate::Tester;
$loaded = 1;
print "ok\n";

eval {
	my $o = Object::Iterate::Tester->new();
	my @expected = qw( a e );
	my %Vowels = map { $_, 1 } @expected;

	my @O = igrep { exists $Vowels{$_} } $o;
		
	foreach my $i ( 0 .. $#O )
		{
		die unless $O[$i] eq $expected[$i];
		}
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";


# $Id$
use strict;

use Test::More tests => 2;

use Object::Iterate qw(imap);

my $o = O->new(1..9);
my @o1 = imap { $_ } $o;
ok( eq_array( \@o1, [1..9] );

# try again.  we need to reset the iterator, but the
# __init__ method should do that for us.
my @o2 = imap { $_ } $o;
ok( eq_array( \@o2, [1..9] );


BEGIN {
package O;

sub new 
	{
	my $class = shift;
	bless { Array => [@_], Pos => 0 }, $class;
	}
	
sub __init__ 
	{
	$_[0]->{Pos} = 1;
	}

sub __more__ 
	{
	$_[0]->{Pos} < @{ $_[0]->{Array} };
	}

sub __next__ 
	{
	$_[0]->{Array}[$_[0]->{Pos}++];
	}
}
__END__

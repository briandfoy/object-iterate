# $Id$
package Object::Iterate;
use strict;

use subs qw(_check_object);
use vars qw(@ISA $VERSION @EXPORT_OK %EXPORT_TAGS 
	$Next $More $Init $Final
	);

=head1 NAME

Object::Iterate - iterators for objects that know the next element
	
=head1 SYNOPSIS

	use Object::Iterate qw(iterate igrep imap);
	
	iterate {...} $object;
	
	my @filtered    = igrep {...} $object;
	
	my @transformed = imap {...} $object;
	
=head1 DESCRIPTION

This module provides control structures to iterate through the
elements of an object that cannot be represented as list of
items all at once.  Objects can represent a virtual collection
that is beyond the reaches of foreach, map, and grep because
they cannot turn themselves into a list.

If the object can return the next object, it can use this module.
Iterate assumes that the object responds to __next__ with the
next element, and to __more__ with TRUE or FALSE if more elements
remain to be processed.  The __init__ method is called before the
first iteration if it exists, and silently skipped otherwise.
The control structure continues until
the __more__ method returns FALSE (which does not mean that it
visited all of the elements but that the object has decided to
stop iterating).  At the end of all iterations (when __more__
returns false), Object::Iterate calls __final__ if it exists, 
and skips it otherwise.

Each control structure sets $_ to the current element, just like
foreach, map, and grep.

=head2  Mutable method names

You do not really have to use the __next__, __more__,
__init__, or __final__ names. They are just the defaults
which Iterate stores in the package variables $Next, $More,
$Init, and $Final respectively.  This module does not export
these variables, so you need to use the full package specification
to change them (i.e. $Object::Iterate::$Next). If your object does not
have the specified methods, the functions will die.  You may
want to wrap them in eval blocks.

Since this module uses package variables to storethese methods names,
the method names apply to every use of the functions no matter the
object.  You might want to local()-ise the variables for different
objects.

Before any control structure does its job, it checks the object to
see if it can respond to these two methods, whatever you decide
to call them, so your object must know that it can respond to
these methods.  AUTOLOADed methods cannot work since the module
cannot know if they exist.

=cut

use Carp qw(croak);
use Exporter;

@ISA         = qw(Exporter);
@EXPORT_OK   = qw(iterate igrep imap);
$VERSION     = '0.05';

%EXPORT_TAGS = (
	all => \@EXPORT_OK,
	);

$Next  = '__next__';
$More  = '__more__';
$Init  = '__init__';
$Final = '__final__';

sub _check_object
	{
	croak( "iterate object has no $Next() method" )
		unless UNIVERSAL::can( $_[0], $Next );
	croak( "iterate object has no $More() method" )
		unless UNIVERSAL::can( $_[0], $More );
		
	$_[0]->$Init if UNIVERSAL::can( $_[0], $Init );
	
	return 1;
	}

=over 4

=item iterate BLOCK, OBJECT

Applies BLOCK to each item returned by ODJECT->__next__.

	iterate { print "$_\n" } $object;
	
This is the same thing as using a while loop, but iterate()
stays out of your way.

	while( $object->__more__ )
		{
		local $_ = $object->__next__;
		
		...BLOCK...
		}
=cut

sub iterate (&$)
	{
	my $sub    = shift;
	my $object = shift;

	_check_object( $object );
	
	while( $object->$More )
		{
		local $_;
		
		$_ = $object->$Next;
		
		$sub->();
		}

	$object->$Final if $object->can( $Final );
	}

=item igrep BLOCK, OBJECT

Applies BLOCK to each item returned by ODJECT->__next__, and returns
all of the elements for which the BLOCK returns TRUE.

	my $output = igrep { print "$_\n" } $object;
	
This is a grep for something that cannot be represented as a
list at one time.

	while( $object->__more__ )
		{
		local $_ = $object->__next__;
		
		push @output, $_ if ...BLOCK...;
		}

=cut

sub igrep (&$)
	{
	my $sub    = shift;
	my $object = shift;
	
	_check_object( $object );
	
	my @output = ();
		
	while( $object->$More )
		{
		local $_;
		
		$_ = $object->$Next;
		
		push @output, $_ if $sub->();
		}

	$object->$Final if $object->can( $Final );
	
	wantarray ? @output : scalar @output;
	}

=item imap BLOCK, OBJECT

Applies BLOCK to each item returned by ODJECT->__next__, and returns
the combined lists that BLOCK returns for each of the elements.

	my $output = imap { print "$_\n" } $object;
	
This is a map for something that cannot be represented as a
list at one time.

	while( $object->$More )
		{
		local $_ = $object->__next__;
		
		push @output, ...BLOCK...;
		}

=cut

sub imap (&$)
	{
	my $sub    = shift;
	my $object = shift;
	
	_check_object( $object );
		
	my @output = ();
		
	while( $object->$More )
		{
		local $_;
		
		$_ = $object->$Next;
		
		push @output, $sub->();
		}

	$object->$Final if $object->can( $Final );

	@output;
	}

=back

=head1 ERROR MESSAGES

=over 4

=item iterate object has no __more__() method at script line N

You need to provide the method to let Object::Iterate determine if
more elements are available.  You don't have to call it __more__ if you
change the value of $Object::Iterate::More.

=item iterate object has no __next__() method at script line N

You need to provide the method to let Object::Iterate fetch the next
element.  You don't have to call it __next__ if you change the value of
$Object::Iterate::Next.

=back

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	https://sourceforge.net/projects/brian-d-foy/
	
If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 TO DO

* let the methods discover the method names per object.

=head1 CREDITS

Thanks to Slaven Rezic for adding __init__ support

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>.

=head1 COPYRIGHT and LICENSE

Copyright 2002 by brian d foy.

This software is available under the same terms as perl.

=cut

1;

require 5.006;
use strict;
use warnings;

my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/Object/Iterate.pm';

my %WriteMakefile = (
	'NAME'          => 'Object::Iterate',
	'ABSTRACT_FROM' => $main_file,
	'VERSION_FROM'  => $main_file,
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	'LICENSE'       => 'perl',

	'PREREQ_PM' => {
		'Test::Data'       => '0',
		'Test::More'       => '0',
		},

	'META_MERGE' => {
        'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'git@github.com:briandfoy/Object-Iterate.git',
				web  => 'https://github.com/briandfoy/Object-Iterate',
				},
			},
		},

	clean => { FILES => 'Object-Iterate-*' },
	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;

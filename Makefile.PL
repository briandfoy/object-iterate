# $Id$
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'          => 'Object::Iterate',
	'ABSTRACT'      => 'iterators for objects that know the next element',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	'VERSION_FROM'  => 'lib/Iterate.pm',
	'LICENSE'       => 'perl',

	'PM'            => {
		'lib/Iterate.pm'    => '$(INST_LIBDIR)/Iterate.pm',
		'lib/Tester.pm'     => '$(INST_LIBDIR)/Iterate/Tester.pm',
		},

	'PREREQ_PM' => {
		'Test::Data'       => '0',
		'Test::More'       => '0',
		},

	'MAN3PODS'     => {
		'lib/Iterate.pm' => '$(INST_MAN3DIR)/Object::Iterate.3',
		'lib/Tester.pm'  => '$(INST_MAN3DIR)/Object::Iterate::Tester.3',
		},

	clean => { FILES => 'Object-Iterate-*' },
	);

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

	'META_MERGE'      => {
		'resources' => {
			'repository' => 'https://github.com/briandfoy/Object-Iterate',
		},
	},

	clean => { FILES => 'Object-Iterate-*' },
	);

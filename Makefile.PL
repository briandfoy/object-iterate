use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'          => 'Object::Iterate',
	'ABSTRACT'      => 'iterators for objects that know the next element',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	'VERSION_FROM'  => 'lib/Object/Iterate.pm',
	'LICENSE'       => 'perl',

	'PREREQ_PM' => {
		'Test::Data'       => '0',
		'Test::More'       => '0',
		},

	clean => { FILES => 'Object-Iterate-*' },
	);

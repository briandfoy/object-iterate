# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	sub ExtUtils::MM_Any::test_via_harness
		{
		my($self, $perl, $tests) = @_;

		return qq|\t$perl "-MTest::Manifest" | .
			qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			qq|'\$(INST_ARCHLIB)')"\n|;
		}
	}

WriteMakefile
	(
	'NAME'           => 'Object::Iterate',
	'VERSION_FROM'   => 'lib/Iterate.pm',
	'PM'             => {
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

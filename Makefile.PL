# $Id$
use ExtUtils::MakeMaker;

my @Tests = map { "t/$_" } qw(
load.t
import.t
tester.t
check_arg.t
grep.t
map.t
iterate.t
);

WriteMakefile
	(
    'NAME'	    => 'Object::Iterate',
    'VERSION'   => '0.04',
     'PM'       => {
        'lib/Iterate.pm'     => '$(INST_LIBDIR)/Iterate.pm',
        'lib/Tester.pm'     => '$(INST_LIBDIR)/Iterate/Tester.pm',
         },
     test => { TESTS => join( " ", @Tests ) },
	);

# $Id$
BEGIN { $| = 1; print "1..4\n"; }
END { print "not ok\n" unless $loaded }

use Object::Iterate qw(imap igrep iterate);
use Object::Iterate::Tester;
$loaded = 1;
print "ok\n";

eval {
	die "Main imap is not defined\n"  unless defined(&main::imap);
	die "Main imap is not defined\n"  unless defined(&imap);
	die "Class imap is not defined\n" unless defined(&Object::Iterate::imap);
	die "Main prototype is wrong [", prototype('main::imap'), "]\n"
		unless prototype('main::imap') eq '&$';
	die "Class prototype is wrong [", prototype('Object::Iterate::imap'), "]\n"
		unless prototype('main::imap') eq '&$';
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval {
	die "Main igrep is not defined\n"  unless defined(&main::igrep);
	die "Main igrep is not defined\n"  unless defined(&igrep);
	die "Class igrep is not defined\n" unless defined(&Object::Iterate::igrep);
	die "Main prototype is wrong [", prototype('main::igrep'), "]\n"
		unless prototype('main::igrep') eq '&$';
	die "Class prototype is wrong [", prototype('Object::Iterate::igrep'), "]\n"
		unless prototype('main::igrep') eq '&$';
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

eval {
	die "Main iterate is not defined\n"  unless defined(&main::iterate);
	die "Main iterate is not defined\n"  unless defined(&iterate);
	die "Class iterate is not defined\n" unless defined(&Object::Iterate::iterate);
	die "Main prototype is wrong [", prototype('main::iterate'), "]\n"
		unless prototype('main::iterate') eq '&$';
	die "Class prototype is wrong [", prototype('Object::Iterate::iterate'), "]\n"
		unless prototype('main::iterate') eq '&$';
	};
print STDERR $@ if $@;
print $@ ? 'not ' : '', "ok\n";

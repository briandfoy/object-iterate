# $Id$

use Test::More tests => 1;
use Test::Prereq;

print "bail out! Makefile.PL needs help!"
	unless prereq_ok();

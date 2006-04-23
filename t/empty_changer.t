#!/usr/local/bin/perl -w

# Version: $Id: empty_changer.t,v 1.1 2006/04/23 04:03:53 drouk Exp $

use strict;
use Test;
BEGIN { plan tests => 3}

print "Testing if module exists ... \n";
use HTML::LinkChanger;
ok(1);

print "Testing if new object can be created without any parameters ... \n";
my $changer = new HTML::LinkChanger();
ok($changer);

my $in = '<a href="http://www.google.com/"><img src="/image.gif"></a>';

print "Testing if input is returned as is if no filters supplied ... \n";

ok($changer->filter($in), $in);


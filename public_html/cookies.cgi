#!/usr/local/bin/perl

use strict;
use CGI qw(:standard);
use CGI::Cookie;
use CGI::Carp qw(fatalsToBrowser);

my $title = 'Cookie Dumper';

print
    header,
    start_html ($title),
    h1 ($title),
    table ({-border => 1},
	   Tr (th ('Key'), th ('Value')),
	   do {
	       my $rows;
	       my %cookies = CGI::Cookie->fetch;
	       while (my ($k, $v) = each %cookies)
	       {
		 $v = $v->value;
		 $rows .= Tr (td ($k), td ($v ? $v : '&nbsp;'));
	       }
	       $rows
	       }),
    end_html;



# Local Variables:
# mode: perl
# mode: auto-fill
# End:


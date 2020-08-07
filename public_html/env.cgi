#!/usr/local/bin/perl

use strict;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use IO::File;

my $title = 'Env Dumper';

print
    header,
    start_html ($title),
    h1 ($title),
    table ({-border => 1},
	   Tr (th ('Key'), th ('Value')),
	   do {
	       my $rows;
	       while (my ($k, $v) = each %ENV)
	       {
		   $rows .= Tr (td ($k), td ($v ? $v : '&nbsp;'));
	       }
	       $rows
	       }),
    end_html,
    "\n";



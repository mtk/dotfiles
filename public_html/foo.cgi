#!/usr/local/bin/perl

use strict;

use CGI::Pretty qw(:all);
use CGI::Carp qw(fatalsToBrowser);

my $title = 'Env Dumper';

my $counter;

if (param ('counter'))
  {
    $counter = param ('counter');
    if ($counter eq 'initial')
      {
	$counter = 1;
      }
    else
      {
	$counter++;
      }
    param ('counter', $counter);
  }

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
  start_form (-action => 'http://localhost/~mtk/foo.cgi'),
  submit ('before'),
  hidden ('counter', 'initial'),
  submit ('after'),
  submit,
  end_form,
  b ('counter is ', $counter);
  end_html;


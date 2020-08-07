#!/usr/local/bin/perl

use strict;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use IO::File;

my $title = 'File Lister';

print
  header,
  start_html ($title),
  h1 ($title),
  table ({-border => 1},
	 Tr (th ('LineNo'), th ('Data')),
	 do {
	   my $rows;
	   my $counter;
	   my $filename = $ENV{'QUERY_STRING'};
	   my $f = IO::File->new ("<$filename")
	     or die "$0: failed to open '$filename': $!\n";
	   while (<$f>)
	     {
	       chomp;
	       $rows .= Tr (td ($counter), td ($_));
	       $counter++;
	     }
	   $rows
	 }),
  end_html,
  "\n";



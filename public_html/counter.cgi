#!/usr/local/bin/perl

use strict;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);

my $title = 'Counter';
use vars qw($counter);

print
    header,
    start_html ($title),
    h1 ($title),
    hr,
    h1 ($counter++ . " (pid $$)"),
    hr,
    end_html;


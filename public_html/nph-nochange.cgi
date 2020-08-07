#!/usr/local/bin/perl
use CGI qw/header -nph/;
open (TMP, "+</tmp/counter.txt");
my $counter = <TMP>;
$counter++;
seek TMP, 0, 0;
print TMP $counter, "\n";
close TMP;
if ($counter % 2)
  {
    print header(-type => 'text/html', -expires => '-1d', -pragma => 'no-cache', '204 No response');
  }
else
  {
    print header(-type => 'text/html', -expires => '-1d', -pragma => 'no-cache', '200 Ok');
    print "<html><body><b>hi there - counter is $counter</b></body></html>\n";
  }

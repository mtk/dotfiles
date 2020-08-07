#!/usr/local/bin/perl

# this script exposes the termination behavior of CGI scripts.
# apache and the netscape enterprise server behave very
# differently.  apache sends a SIGTERM and then 3 seconds
# later sends a SIGKILL.  netscape sends a SIGPIPE and expects
# you to do something rational with it (like exit).  but, of course,
# many don't check and don't exit.

use strict;

use Sys::Hostname;
use CGI qw(:all :push -nph);

my $hn = hostname;

$SIG{TERM} =
$SIG{PIPE} =
$SIG{INT}  =
$SIG{HUP}  =
    sub { die "choke: <$_[0]>" };

eval {

    my $counter;

    print
	multipart_init (-boundary => '----- MULTIPART BOUNDARY');

    while (1)
    {
	my $buf = multipart_start (-type => 'text/plain');
	$buf .= 'Tick: ' . ++$counter;
	$buf .= multipart_end;

	print $buf;

	# log it
	open (M, ">>/usr/local/public_html/ka.log");
	print M "$counter\n";
	close M;

	# slow down
	sleep 1;
    }
};

if ($@)
{
    my $counter = 1;

    while (1)
    {
	# log it
	open (M, ">>/usr/local/public_html/ka.log");
	print M " ($hn)[$counter]{", scalar (localtime), "}: <$@>\n";
	close M;

	$counter++;

	# don't crap out forever
	exit if $counter > 100;
    }
}




# Local Variables:
# mode: perl
# End:




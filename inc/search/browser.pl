#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## BROWSER
our (@sys, @vary, @systems, @proxies);
use IO::Socket::INET;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
binmode STDOUT, ":utf8";
for my $sys(@sys) {
  for my $vary(@vary) {
    my $ag="$sys) $vary";
    push @systems, $ag;
  }
}

our ($system, $agent, $ua, $timeout, $utimeout);

if (defined $timeout) { $timeout=$timeout; }
elsif ($utimeout) { $timeout=$utimeout; }
else{ $timeout=10; }


$agent="Mozilla/5.0 (".$systems[rand @systems];
$ua=LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
$ua->default_header('Accept' => ('text/html'));
$ua->env_proxy;

## SET PROXY
our ($psx, $proxy, $prandom, $uproxy, $uproxyrandom);
if (defined $proxy || defined $prandom ) { UA(); }
if ($uproxy || $uproxyrandom ) { UA(); }

## RENEW AGENT
sub getNewAgent {
  $agent="Mozilla/5.0 (".$systems[rand @systems];
  $ua=LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
}

## MAX POSITIVE SCAN RESULTS
## Chnage for more positive scans!!
our $limit="500" if !defined $limit;
$ua->timeout($timeout);
#sub UA { $ua->proxy([qw/ http https ftp ftps /] => $psx); $ua->cookie_jar({ }); }

1;

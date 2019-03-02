#!/usr/bin/perl
use File::Basename;
use FindBin '$Bin';
use strict;
use warnings;
use Term::ANSIColor;
use URI::Escape;
use HTML::Entities;
use HTTP::Request::Common;
use Digest::MD5;
use MIME::Base64;
use Net::Ping;
use HTTP::Cookies;

## Copy@right Alisam Technology see License.txt

## INTRODUCTION ###########################################################################################
#   This script is Copyright (c) 2015 Alisam Technology
#   [::] SCRIPT NAME:  atscan scanner
#   [::] AUTOR:        Ali Mehdioui founder of Alisam Technology.
#   [::] FB:           https://facebook.com/Alisam.Technology
#   [::] Twitter:      https://twitter.com/AlisamTechno
#   [::] Pastebin      http://http://pastebin.com/u/Alisam_Technology
#   [::] GIT:          https://github.com/AlisamTechnology
#   [::] YOUTUBE:      http://youtube.com/c/AlisamTechnology
#
## DESCRIPTION ###########################################################################################
#   Tool to scan engines, dorks and sites for commun errors and vulnerabilities.
#   Search engine 
#   XSS scanner. 
#   LFI / ADF scanner.
#   Filter wordpress and Joomla sites in the server. 
#   Find Admin page.
#   Decode / Encode MD5 + Base64.
#   Ports scan. 
#   Scan E-mails in sites. 
#   Use proxy. 
#   Random user agent. 
#   Random proxy. 
#   Scan errors. 
#   Detect Cms.
#   Multiple instant scans. 
#   Extern commands execution.
#   Usage by commands and by an easy interactive mode. 
#   Disponible on BlackArch Linux and DracOs systems.
#   Works in all platforms.
#   Perl required!
##########################################################################################################

require "$Bin/inc/top.pl";

## VARIABLES 
our ($Hstatus, $validText, $WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $command, $mmd5, $mencode64, $mdecode64, $port, 
     $mindex, $mdom, $Target, $exploit, $p, $tcp, $udp, $proxy, $prandom, $help, $output, $replace, $replaceFROM, $dork, $mlevel, $unique, $shell, $nobanner, $beep, $ifinurl, 
	 $noverbose, $motor, $timeout, $limit, $checkVersion, $searchIps, $regex, $searchRegex, $noQuery, $ifend, $uninstall, $post, $get, $brandom, $data, $payloads, $mrandom, 
	 $content, $toolInfo, $config, $freq, $headers, $msource, $ping, $exclude, $expHost, $expIp, $zone, $validShell, $interactive, $popup, $all, $repair, $zoneH, $cokie, 
	 $bugtraq, $fullHeaders, $geoloc, $getlinks, $shodan, $apikey, $shocount, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, $shoreverse, $shomyip, 
	 $shoapiInfo, $shoports, $shoprotos, $shotokens, $shohoneyscore, $shofilters, $facets, $cx);

## ARGUMENTS
use Getopt::Long qw(GetOptions);
our %OPT;
Getopt::Long::GetOptions(\%OPT, 'status=s'=>\$Hstatus, 'valid|v=s'=>\$validText, 'wp'=>\$WpSites, 'joom'=>\$JoomSites, 'sql'=>\$xss, 'lfi'=>\$lfi, 'joomrfi'=>\$JoomRfi, 'wpafd'=>\$WpAfd,
                         'admin'=>\$adminPage, 'shost'=>\$subdomain, 'upload'=>\$mupload, 'zip'=>\$mzip, 'email'=>\$eMails, 'command|c=s'=>\$command, 'md5=s'=>\$mmd5, 'encode64=s'=>\$mencode64,
                         'decode64=s'=>\$mdecode64, 'port=s'=>\$port, 'index'=>\$mindex, 'host'=>\$mdom, 't|target=s'=>\$Target, 'exp|e=s'=>\$exploit, 'p|param=s'=>\$p, 'tcp'=>\$tcp, 'udp'=>\$udp, 
                         'proxy=s'=>\$proxy, 'prandom=s'=>\$prandom, 'help|h'=>\$help, 'save|s=s'=>\$output, 'replace=s'=>\$replace, 'replaceFROM=s'=>\$replaceFROM, 'dork|d=s'=>\$dork, 'level|l=s'=>\$mlevel,
                         'unique'=>\$unique, 'shell=s'=>\$shell, 'nobanner'=>\$nobanner, 'beep'=>\$beep, 'ifinurl=s'=>\$ifinurl, 'noverbose'=>\$noverbose, 'm|motor=s'=>\$motor, 'timeout=s'=>\$timeout,
                         'limit=s'=>\$limit, 'update'=>\$checkVersion, 'ips'=>\$searchIps, 'regex=s'=>\$regex, 'sregex=s'=> \$searchRegex, 'noquery'=> \$noQuery, 'ifend'=>\$ifend,
                         'uninstall'=> \$uninstall, 'post'=>\$post, 'get'=>\$get, 'brandom'=>\$brandom, 'data=s'=>\$data, 'payload=s'=>\$payloads, 'mrandom=s'=>\$mrandom, 'content'=>\$content,
                         'tool|?'=>\$toolInfo, 'config'=>\$config, 'freq=s'=>\$freq, 'header=s'=>\$headers, 'source=s'=>\$msource, 'ping'=>\$ping, 'exclude=s'=>\$exclude, 'expHost=s'=>\$expHost,
                         'expIp=s'=>\$expIp, 'zone=s'=>\$zone, 'interactive|i'=>\$interactive, 'vshell=s'=>\$validShell, 'popup'=>\$popup, 'all'=>\$all, 'repair'=>\$repair, 'zoneH=s'=>\$zoneH,
                         'cookies=s'=>\$cokie, 'bugtraq'=>\$bugtraq, 'geoloc'=>\$geoloc, 'fullHeaders'=>\$fullHeaders, 'getlinks'=>\$getlinks, 'shodan'=>\$shodan, 'apikey=s'=>\$apikey, 
						 'count=s'=>\$shocount, 'query'=>\$shoquery, 'querysearch=s'=>\$shoquerySearch, 'querytags'=>\$shoqueryTags, 'services'=>\$shoservices, 
						 'dnsresolve=s'=>\$shoresolve, 'dnsreverse=s'=>\$shoreverse, 'myip'=>\$shomyip, 'apinfo'=>\$shoapiInfo, 'facets=s'=>\$facets, 'ports'=>\$shoports, 'protocols'=>\$shoprotos, 
						 'filters'=>\$shofilters, 'tokens=s'=>\$shotokens, 'honeyscore=s'=>\$shohoneyscore, 'cx=s'=>\$cx) or badArgs();

## CHOMP ARGS STRINGS
our @toChomp=($Hstatus, $validText, $command, $mmd5, $mencode64, $mdecode64, $port, $Target, $exploit, $p, $proxy, $prandom, $output,
              $replace, $replaceFROM, $dork, $mlevel, $shell, $ifinurl, $motor, $timeout, $mrandom, $limit, $regex, $searchRegex, $data,
              $payloads, $freq, $headers, $msource, $exclude, $expHost, $expIp, $zone, $validShell, $zoneH, $bugtraq, $apikey, 
			  $shocount, $shoquerySearch, $shoresolve, $shoreverse, $shofilters, $shotokens, $cx, $facets, $shohoneyscore);
for (@toChomp) { chomp ($_) if defined $_; }

## INCLUDES
require "$Bin/inc/includes.pl";


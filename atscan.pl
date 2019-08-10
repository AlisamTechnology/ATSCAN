#!/usr/bin/perl

#############################################################################################################################
## INTRODUCTION #############################################################################################################
#   This script is Copyright (c) 2015 Alisam Technology see License.txt
#   [::] SCRIPT NAME:  atscan scanner
#   [::] AUTOR:        Ali Mehdioui founder of Alisam Technology
#   [::] FB:           https://facebook.com/Alisam.Technology
#   [::] Twitter:      https://twitter.com/AlisamTechno
#   [::] GIT:          https://github.com/AlisamTechnology
#   [::] YOUTUBE:      http://youtube.com/c/AlisamTechnology
#
## DESCRIPTION ##############################################################################################################
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
##############################################################################################################################
##############################################################################################################################
## PACKAGES
use File::Basename;
use FindBin '$Bin';
use strict;
use warnings;
use Term::ANSIColor;
use open ':std', ':encoding(UTF-8)';
use Digest::MD5;
use Net::Ping;
use HTTP::Cookies;
use lib $Bin.'/inc/lib';
use lib $Bin.'/inc/lib/lib';
use Target;
use Subs;
use Getagent;
use Getme;
use Print;
use Banner;
use Exploits;
use Validate;
use Checkinputs;
use Checkcms;
use Checkplugins;
use Checkerrors;

## CLEAR
($^O!~/Win/) ? printf "\033c" : system("cls");

## VARIABLES 
my ($Hstatus, $validText, $WpSites, $JoomSites, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $command, $mmd5, $mencode64, $mdecode64, $port, 
     $mdom, $Target, $exploit, $parametro, $validTextAll, $tcp, $udp, $proxy, $prandom, $help, $output, $replace, $replaceFROM, $dork, $mlevel, $unique, $shell, $nobanner, $beep, $ifinurl, 
	 $noverbose, $motor, $timeout, $limit, $checkVersion, $searchIps, $regex, $searchRegex, $noQuery, $ifend, $uninstall, $post, $get, $brandom, $data, $mrandom, 
	 $content, $toolInfo, $config, $freq, $headers, $msource, $ping, $exclude, $excludeAll, $expHost, $expIp, $zone, $validShell, $interactive, $popup, $all, $repair, $zoneH, $cookies, 
	 $bugtraq, $fullHeaders, $geoloc, $getlinks, $shodan, $apikey, $shocount, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, $shoreverse, $shomyip, 
	 $shoapiInfo, $shoports, $shoprotos, $shotokens, $shohoneyscore, $shofilters, $facets, $validServer, $cx);

## ARGUMENTS
use Getopt::Long qw(GetOptions);
my %OPT;
Getopt::Long::GetOptions(\%OPT, 'status=s'=>\$Hstatus, 'valid|v=s'=>\$validText, 'validAll=s'=>\$validTextAll, 'wp'=>\$WpSites, 'joom'=>\$JoomSites, 'xss'=>\$xss, 'sql'=>\$sql, 'lfi'=>\$lfi, 'joomrfi'=>\$JoomRfi, 'wpafd'=>\$WpAfd,
                         'admin'=>\$adminPage, 'subdomain'=>\$subdomain, 'upload'=>\$mupload, 'zip'=>\$mzip, 'email'=>\$eMails, 'command|c=s'=>\$command, 'md5=s'=>\$mmd5, 'encode64=s'=>\$mencode64,
                         'decode64=s'=>\$mdecode64, 'port=s'=>\$port, 'host'=>\$mdom, 't|target=s'=>\$Target, 'exp|e|payload=s'=>\$exploit, 'p|param=s'=>\$parametro, 'tcp'=>\$tcp, 'udp'=>\$udp, 
                         'proxy=s'=>\$proxy, 'prandom=s'=>\$prandom, 'help|h'=>\$help, 'save|s=s'=>\$output, 'replace=s'=>\$replace, 'replaceFROM=s'=>\$replaceFROM, 'dork|d=s'=>\$dork, 'level|l=s'=>\$mlevel,
                         'unique'=>\$unique, 'shell=s'=>\$shell, 'nobanner'=>\$nobanner, 'beep'=>\$beep, 'ifinurl=s'=>\$ifinurl, 'noverbose'=>\$noverbose, 'm|motor=s'=>\$motor, 'timeout=s'=>\$timeout,
                         'limit=s'=>\$limit, 'update'=>\$checkVersion, 'ips'=>\$searchIps, 'regex=s'=>\$regex, 'sregex=s'=> \$searchRegex, 'noquery'=> \$noQuery, 'ifend'=>\$ifend,
                         'uninstall'=> \$uninstall, 'post'=>\$post, 'get'=>\$get, 'brandom'=>\$brandom, 'data=s'=>\$data, 'mrandom=s'=>\$mrandom, 'content'=>\$content,
                         'tool|?'=>\$toolInfo, 'config'=>\$config, 'freq=s'=>\$freq, 'header=s'=>\$headers, 'source=s'=>\$msource, 'ping'=>\$ping, 'exclude=s'=>\$exclude, 'excludeAll=s'=>\$excludeAll, 'expHost=s'=>\$expHost,
                         'expIp=s'=>\$expIp, 'zone=s'=>\$zone, 'interactive|i'=>\$interactive, 'vshell=s'=>\$validShell, 'popup'=>\$popup, 'all'=>\$all, 'repair'=>\$repair, 'zoneH=s'=>\$zoneH,
                         'cookies=s'=>\$cookies, 'bugtraq'=>\$bugtraq, 'geoloc'=>\$geoloc, 'fullHeaders'=>\$fullHeaders, 'getlinks'=>\$getlinks, 'shodan'=>\$shodan, 'apikey=s'=>\$apikey, 
						 'count=s'=>\$shocount, 'query'=>\$shoquery, 'querysearch=s'=>\$shoquerySearch, 'querytags'=>\$shoqueryTags, 'services'=>\$shoservices, 
						 'dnsresolve=s'=>\$shoresolve, 'dnsreverse=s'=>\$shoreverse, 'myip'=>\$shomyip, 'apinfo'=>\$shoapiInfo, 'facets=s'=>\$facets, 'ports'=>\$shoports, 'protocols'=>\$shoprotos, 
						 'filters'=>\$shofilters, 'tokens=s'=>\$shotokens, 'server=s'=>\$validServer, 'honeyscore=s'=>\$shohoneyscore, 'cx=s'=>\$cx) or Print::bad();

for (keys %OPT) { chomp $OPT{$_} if defined $OPT{$_}; }

## CHECK USER CONFIGURATION
my ($password, $dateupdate, $method);
$password        = Clientconfig::checkSetting("password");
$dateupdate      = Clientconfig::checkSetting("update");
$method          = Clientconfig::checkSetting("method") if !defined $get and !defined $post;
$interactive     = Clientconfig::checkSetting("interactive") if !defined $interactive;
$proxy           = Clientconfig::checkSetting("proxy") if !defined $proxy;
$apikey          = Clientconfig::checkSetting("apikey") if !defined $apikey;
$cx              = Clientconfig::checkSetting("cx") if !defined $cx;
$prandom         = Clientconfig::checkSetting("prandom") if !defined $prandom;
$brandom         = Clientconfig::checkSetting("brandom") if !defined $brandom;
$mrandom         = Clientconfig::checkSetting("mrandom") if !defined $mrandom;  
$mlevel          = Clientconfig::checkSetting("level") if !defined $mlevel;
$zone            = Clientconfig::checkSetting("zone") if !defined $zone;
$motor           = Clientconfig::checkSetting("motor") if !defined $motor;
$nobanner        = Clientconfig::checkSetting("nobanner") if !defined $nobanner;
$noverbose       = Clientconfig::checkSetting("noverbose") if !defined $noverbose;
$beep            = Clientconfig::checkSetting("beep") if !defined $beep;
$ifend           = Clientconfig::checkSetting("ifend") if !defined $ifend;
$unique          = Clientconfig::checkSetting("unique") if !defined $unique;
$timeout         = Clientconfig::checkSetting("timeout") if !defined $timeout;
$freq            = Clientconfig::checkSetting("freq") if !defined $freq;
$limit           = Clientconfig::checkSetting("limit") if !defined $limit;
$command         = Clientconfig::checkSetting("command") if !defined $command;
$limit           = 500 if !$limit;
$dateupdate      = 1 if !$dateupdate;

## BANNER
Banner::banner() unless (defined $nobanner || $nobanner);

## CHECK LOGIN
use Login;
Login::login($password) if ($password);

## CHECK IF A SCAN IS DEFINED
my $narg = 0;
for ($toolInfo, $dork, $Target, $help, $mmd5, $mdecode64, $mencode64, $config, $interactive, $repair, $checkVersion, $bugtraq, $shodan, $uninstall) {
  $narg++ if defined $_;
}
Print::no_args() unless $narg > 0;

## DISCLEAMER
Print::discleamer();
Print::separaBlocks();

## USAGE ERRORS
use UseErrors;
UseErrors::check_scans($WpSites, $JoomSites, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $mmd5, $mencode64, $mdecode64, $port);
UseErrors::check_arguments1($mrandom, $motor, $mlevel, $dork, $unique, $shodan, $bugtraq);
UseErrors::check_arguments2($motor, $mrandom, $Target, $dork, $JoomRfi, $shell);
UseErrors::check_arguments3($shodan, $bugtraq, $apikey, $popup, $command, $zoneH, $dork, $replace, $replaceFROM);
UseErrors::check_arguments4($eMails, $port, $ping, $udp, $tcp, $regex, $searchRegex, $searchIps, $Hstatus, $validText, $get, $post, $method, $data, $mupload, $limit);

## INTERACTIVE
use Interactive;
Interactive::interactive() if (defined $interactive || $interactive);

## USER CONFIG
use Clientconfig;
Clientconfig::ClientConfiguration() if (defined $config);

## UNINSTALL
use Uninstall;
Uninstall::unistall() if defined $uninstall;

## TOOL
use Tool;
Tool::tool() if defined $toolInfo;

## HELP
use Help;
Help::help() if defined $help;

## ENCODE DECODE
use Encodeme;
my $cc = 0;
for ($mmd5, $mencode64, $mdecode64) {
  if (defined $_) {
    $cc++;
    Encodeme::encodeme($_, $cc);
  }
}

## DEFINE 
my (@proxies, @exploits, @motors, @target_urls, @dorks, @targets, @aTscans, $isscan);

## PROXY
for ($proxy, $prandom) { @proxies = Subs::getProx($_) if (defined $_ || $_); }

## APIKEY
my @apikeys = Subs::buildArrays($apikey) if (defined $apikey || $apikey);

## REGEX
my @regs = Subs::buildArrays($regex) if (defined $regex || $regex);
push @regs, Exploits::V_EMAIL() if defined $eMails;
push @regs, Exploits::V_IP() if defined $searchIps;
my @searchRegexs = Subs::buildArrays($searchRegex) if defined $searchRegex;
my @commands = Subs::buildArrays($command) if (defined $command || $command);

## CHECK FOR DEFINED EXPLOITS
for ($exploit, $expHost, $expIp) { @exploits = Subs::buildArrays($_) if (defined $_ || $_); }

## GET TARGETS
if (!defined $shodan) {
  my $build_dorks = new Target();
  if (defined $mlevel || $mlevel) {
    if (defined $dork) { @dorks = Subs::buildArrays($dork); }
    elsif (defined $Target) {
	  my $dorks = $build_dorks->_build_me($Target);
      @dorks = @{$dorks};
    }
  }else{
    if (defined $Target) {
	  my $targets = $build_dorks->_build_me($Target);
      @targets = @{$targets} if ($targets);
	}
  }
}

## SET ENGINES
use Engine;
my $engine = Engine::get_engine($motor, $mrandom, $mlevel, $shodan, $bugtraq);
@motors = @{$engine};

## AGENT
use Getagent;
my $agento = new Getagent();
my $agent = $agento->get_agent($freq, "");
	
## SET UA
my $ua = $agento->get_ua($agent, $timeout, $headers, $cookies);

## COCKIES
Subs::cockies($cookies);

## FREQUENCY START TIME
my $start = Subs::frequency();

## CHECK FOR UPDATE
use Upad;
Upad::checkforupdates($ua, $fullHeaders, $dateupdate);

## UPDATE
use Update;
Update::update($ua, $fullHeaders, $repair) if (defined $checkVersion);
Update::repair($ua, $fullHeaders, $repair) if (defined $repair);

## EXIT SHIRT SCANS
for ($help, $uninstall, $config, $toolInfo, $checkVersion, $repair, $mmd5, $mencode64, $mdecode64) { exit if defined $_; }

## THIS NEED SCAN RESULT TO BE PRINTED
for ($exploit, $expIp, $expHost, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mzip, $mupload, 
	 $parametro, $replace, $replaceFROM, $Hstatus, $validText, $validTextAll, $exclude, $excludeAll, 
	 $validShell, $validServer, $WpSites, $JoomSites, $eMails, $searchIps) { 
     $isscan = 1 if (defined $_ || $_);
}

## CONNECTED PROXIES AND APIKEYS
use Connect;
my ($v_proxies, $v_apikeys) = Connect::testConnection($ua, $proxy, $prandom, $apikey, $cx, \@motors, \@proxies, \@apikeys, $shodan);
$ua = $agento->use_proxy($freq, $start, $ua, \@{$v_proxies}, $prandom, "") if (scalar @{$v_proxies} > 0);

## PRINT PANEL
Print::print_info1($dork, $mlevel, $motor, scalar @motors, $mrandom, $ifinurl, $unique, $post, $get, $getlinks);
Print::print_info($Target, $exploit, $expHost, $expIp, $parametro, $replace, $replaceFROM);
Print::print_valid_info($Hstatus, $validText, $validTextAll, $exclude, $excludeAll, $validShell, $validServer);
Print::separaBlocks();

## WAIT 
Print::print_espera();

## BUGTRAQ
use Bugtraq;
Bugtraq::bugs($ua, $dork, \@dorks, $mlevel, $limit, $fullHeaders) if defined $bugtraq;

## SHODAN API
if (defined $shodan) {
  my @shos;
  if (defined $dork || defined $Target) {
    if (defined $dork) { @shos = Subs::buildArrays($dork); }
    else{
	  my $build = new Target();
	  my $shos = $build->_build_me($Target);
      @shos = @{$shos};
    }
  }
  my @v_apikeys = @{$v_apikeys};
  use Shodan;
  Shodan::shodan($ua, $dork, $Target, $mlevel, $limit, $fullHeaders, $output, $shocount, $shoquery, 
					$shoreverse, $shoapiInfo, $shoports, $shoprotos, $shotokens, $shohoneyscore, 
					$shofilters, $shomyip, $facets, $shoquerySearch, $shoqueryTags, $shoservices, 
					$shoresolve, \@shos, $v_apikeys[rand @v_apikeys], \@commands, $popup);
  exit;
}

## GET SEARCH
if (!defined $shodan && (scalar @targets < 1)) {
  Print::begen();
  Print::print_title_scan("1") if !defined $port;
  Print::end();

  use Search;
  sleep 1;
  my $v_apikey = $apikeys[rand @{$v_apikeys}];
  my $search = Search::msearch($ua, $dork, $Target, $mlevel, \@dorks, \@motors, $v_apikey, $cx, $zone, $unique, $ifinurl, \@searchRegexs, $agent, $timeout, $headers, $cookies, $fullHeaders);
  @targets = @{$search} if ($search);
}

## PRINT TARGETS RESULTS
@targets = Subs::checkDuplicate(@targets);
Print::count_targets(\@targets);

## PARSER
if (defined $getlinks) {
  my $deep_targets = Search::doDeepSearch(\@targets, $ua, $fullHeaders, $post, $get);
  push @targets, @{ $deep_targets };
  Print::count_targets(\@targets);
}

## PRINT SCAN TITLE
my $v = 1;
my @sc;
for ($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $mmd5, $mencode64, $mdecode64, $port, $sql) { 
  $v++;
  push @sc, $v if defined $_;
}
  
if (scalar @sc > 0) {
  Print::begen();
  for (@sc) { Print::print_title_scan($_); }
  Print::end();
}

## EXPLOITS ALERT
my $jv;
for ($WpSites, $JoomSites, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip) { 
  $jv = 1 if defined $_; 
}
Print::exploits_alert() if ($jv && !defined $exploit);

## CHECK TARGET REPEATER AND RANG
@targets = Subs::target_urls_repeater(\@targets);

## START SCAN 
my ($i, $in) = 0;
for my $targ(@targets) {
  $i++;
  ## CHECK USER ALTERATION
  my $url = new Target();
  for ($mdom, $WpAfd, $adminPage, $JoomRfi, $subdomain, $mzip, $mupload) { 
    $targ = $url->host($targ) if defined $_; 
  }
  $targ = $url->cleanURL($targ) if defined $subdomain;
  $targ = $url->noQuery($targ) if defined $noQuery;
  $targ = $url->replace($targ, $replace) if defined $replace;
  $targ = $url->replaceFROM($targ, $replaceFROM) if defined $replaceFROM;
  
  ## CHECK FOR PARAMS
  my @params = Subs::params($targ, $parametro) if (defined $parametro);
  
  ## BUILD EXPLOITS
  @exploits = Exploits::exploits($xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mzip, $mupload, \@exploits);
    
  ## BUILD URLS
  @target_urls = Subs::target_urls($targ, \@params, \@exploits, $subdomain, $JoomRfi, $shell);
  @target_urls = Subs::checkDuplicate(@target_urls);
  
  ## PRINT TARGET AND IP
  my $ipp = new Validate();
  my $ips = $ipp->get_target_ip($targ);
  Print::print_target($targ, $i, scalar @targets, $ips);

  ## TARGET URLS
  my $getme = new Getme();
  my $i = 0;
  for my $ur(@target_urls) {
    $i++;
	## PRINT URL
	Print::print_Beg($ur, $i, scalar @exploits, $isscan);

	## PORTS
	if (defined $port) {
	  my @v_proxies = @{$v_proxies};
	  my $psx = $v_proxies[rand @v_proxies] if (defined $proxy);	  
	  $psx = $getme->newpsx($ua, $freq, $start, $v_proxies, $freq, $start, $psx, $prandom) if (defined $prandom);	  
	  use Scanport;
	  Scanport::ports($ur, \@commands, $port, $udp, $tcp, $proxy, $prandom, $psx, $ping, $timeout);
	  exit;
	}
	
	## GET AGENT
	$agent = $agento->get_agent($freq, $start, "1") if defined $brandom;
	Print::print_agent($agent) if !$noverbose;
	
	## PROXY RANDOM ALERT 
	$ua = $agento->use_proxy($freq, $start, $ua, \@{$v_proxies}, $prandom, "1") if (defined $prandom);

	## GET URL
	my ($redirect, $re, $ht, $st, $sh, $fh);	
	if (defined $data) {
	  my $datas = $url->dataFields($data);
	  ($redirect, $re, $ht, $st, $sh, $fh) = $getme->navdatapost($ua, $get, $post, $url, $datas, $fullHeaders);
	}else{
	  ($redirect, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $ur, $fullHeaders, $post, $get);
	}
	
	my $continue;
	if (!$noverbose) {
	  ## CHECK FOR REDIRECTS
	  if ($redirect) { Print::print_redirect($redirect); }
	  
	  ## PRINT STATUS AND SERVER NAME
	  $continue = Print::print_sub_beg($st, $sh);
	  if ($st ne 500) {
	    ## CHECK IMPUTS
	    Checkinputs::Check_Inputs($ht);
	  
	    ## CHECK CMS
	    Checkcms::checkCms($ht);
	  
	    ## CHECK PLUGINS
	    Checkplugins::checkPlugins($ht);
	  
	    ## CHECK ERRORS
	    Checkerrors::check_Errors($ht);
	  }
	}
	
	## CHECK FOR VALIDATION
	my $validate = new Validate();
	my $validated = 1;
	$validated = $validate->v_validate($st, $ht, $sh, $xss, $sql, $lfi, $WpAfd, $Hstatus, $validText, $validTextAll, $exclude, $excludeAll, $validShell, $validServer, $WpSites, $JoomSites);
	my $valido = $validated ? 1 : "";
	for ($searchIps, $eMails, $regex, $searchRegex) { $valido = 1 if (defined $_ && $st eq 200); }
	$in++;
	
	## PRINT VALID SCAN
	Print::print_End($ur, $st, $ht, $valido, $isscan, \@regs, $output, $beep) if $continue;
	
	## GEOLOC
	if (defined $geoloc) {
	  if ($st ne 500) {
	    my $sr = Subs::geoServer();
	    my $u = "$sr/$ips";
	    my ($redir, $rg, $hg, $sg, $seg, $fg) = $getme->navget($ua, $u, $fullHeaders, "", "");
	    Print::print_geoloc($hg);
	  }
	}
		
	## PRINT SAVE HTML AND HEADERS
	if (defined $content) {  Print::print_content($ht); }
	if (defined $msource) { Print::printSource($ur, $ht, $msource); }
	if (defined $fullHeaders) { Print::fullRequestHeaders(); }  
	
	## EXTERN COMMANDS
	if (defined $command && !defined $shodan) {
	  my $ext_cmd = Print::checkExternComnd($ur, \@commands);
	  Print::extern_process($ur, $popup, $ext_cmd);
	}	
	
	## ZONE-H
	if (defined $zoneH) {
	  my $hz = $getme->navpost($ua, $zoneH, $ur, $fullHeaders);
	  Print::print_zoneH($hz) if $hz;
	}
	push @aTscans, $ur if $valido;
	last if $in eq $limit;
  }
}

Print::separator();
Print::separaBlocks();
my $np = $isscan ? scalar @aTscans : scalar @targets;
Print::endscan($np, $limit, $ifend, $isscan, $output);

#############################################################################################################################
## End ######################################################################################################################

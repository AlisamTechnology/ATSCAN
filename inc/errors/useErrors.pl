#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($Target, $xss, $data, $lfi, $ifinurl, $WpSites, $Hstatus, $adminPage, $subdomain, $eMails, $JoomSites, $command, $mzip, $mupload,
     $port, $JoomRfi, $searchIps, $mlevel, $WpAfd, $mindex, $content, $ping, $replace, $replaceFROM, $validShell, $popup, $zoneH, $shodan, 
	 $apikey, $cx, $bugtraq);
our ($regex, $V_IP, $mrandom, $tcp, $udp, $dork, $motor, $searchRegex, $shell, $unique, $post, $limit, $validText, $get, $config, $payloads, 
     $exploit, $method, @replace, @TT, @SCAN_TITLE, @DT, @OTHERS, @c, @ZT, @motors);



## SHODAN
if (defined $shodan) {
  if (!defined $apikey) {
    print $c[4]."[!] USAGE: --shodan --apikey <key>\n"; 
	print $c[4]."[!] You can get an apikey here https://www.shodan.io/\n";
	exit();
  }
}

## CHECK JSON MODULE
if (defined $apikey || $apikey) {
  checkCpanModules();
}

## BUGTRAQ
if (defined $bugtraq) {
  if (!defined $dork) {
    print $c[4]."[!] USAGE: --bugtraq --dork <dork> --level <level>\n"; 
	exit();
  }
}

## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if (defined $Target) {
  my $Targ=Targs();
  if ($Targ<1) { print $c[4]."[!] $OTHERS[7]\n"; exit(); }
}

## CHECK POPUP ARGUMENT IS USED WITH EXTERN COMMANDS
if (defined $popup and !defined $command) {
  print $c[4]."[!] --$ZT[26]\n"; exit();
}

if (defined $exploit or $exploit) {
  my $Targ=Targs();
  if ($Targ<1) { print $c[4]."[!] $OTHERS[7]\n"; exit(); }
}

## ZONE-H
if (defined $zoneH) {
  if ($zoneH!~/(.*)=>(.*)/) {
    print $c[4]."[!] zoneH must be \"Notifier => Url\" \n"; exit();
  }
}

## CHECK TARGET PROTOCOL
if (defined $Target) {   
  if ((!-e $Target) && ($Target!~/$V_IP/) && !defined $ping) {
    if ($Target!~/https?:\/\//) { print $c[4]."[!] $DT[16]\n"; exit(); }
  }
}

## CRAWLER
if (defined $mindex) {
  if (!defined $mlevel && !$mlevel) {
    print $c[4]."[!] $DT[20]\n"; exit();
  }
}

## REPLACE
if (defined $replace || defined $replaceFROM) {
  for (@replace) {
    if (defined $_ and $_ !~ /=>/) {
      print $c[4]."[!] $ZT[27] \"STRING => NEW_STRING\"\n"; exit();
    }
  }
}

## CHECK RANDOM PARAMS
if (defined $mrandom && (!defined $mlevel && !$mlevel)) { print $c[4]."[!] $DT[38]\n"; exit(); }

## ARGUMENTS VERIFICATION (LEVEL / PORTS)
if ((defined $dork)&&(!defined $mlevel && !$mlevel && !defined $shodan)) { print $c[4]."[!] $DT[40]\n"; exit(); }
if ((defined $port) && (!defined $tcp and !defined $udp)) { print $c[4]."$DT[23]\n"; exit(); }

## MORE ARGUMENTS PROCESS VERIFICATION
if ((defined $dork) || (defined $Target)) { 
  if ((defined $JoomRfi) and (!defined $shell)) { print $c[4]."[!] $DT[41]\n"; exit(); }
}

if ((!defined $dork) && (defined $unique)) { print $c[4]."[!] $DT[21]\n"; exit(); }
if (defined $regex or defined $eMails or defined $searchRegex or defined $searchIps) {
  if (defined $Hstatus) { print $c[4]."[!] $SCAN_TITLE[2]"; exit(); }
}

## CHECK MOTORS ARGUMENTS
if (defined $motor || $motor) {
  if (defined $mrandom || $mrandom) {
    print $c[4]."$TT[14]\n"; exit();
  }
  abcd($motor);
}
if ($motor) { abcd($motor); }
sub abcd {
  my $abcd=$_[0];
  my @abcd;
  if ($abcd=~/,/) { @abcd=split(", ", $abcd); }
  else{ push @abcd, $abcd; }
  for my $ad(@abcd) {
    if ($ad!~/(bing|ask|google|yandex|sogou|exalead|googleapis)/) { 
	  print $c[2]."[!] $DT[25]\n".$c[4]."   $DT[27] \n   $OTHERS[5] -m google,bing,...\n"; exit();
	}
  }
}

## CHECK LEVEL
if (defined $mlevel || $mlevel) {
  if ($mlevel!~/^[0-9,.E]+$/) { print $c[4]."$TT[15]\n"; exit(); }
}

## ADVISE DATA WITHOUT METHOD
if (defined $data and (!defined $post && !defined $get && !defined $mupload && !$method)) { print $c[4]."[!] $TT[16]\n"; exit(); }

## CHECK PAUSE ARGUMENT
if (defined $data) {
  if ($limit<500) {
    if (!defined $Hstatus && !defined $validText) { print $c[4]."[!] $TT[17]\n"; exit(); }
  }
}

## WORDLIST IN DATA
sub data_alert {
  print $c[4]."[!] $ZT[28]\n"; exit();
}

## IF DATA FILES > 1
sub adviseDataFile {
  print $c[2]."[!] $ZT[29]\n"; exit();
}

## IF DATA FILE NOT EXISTS
sub advise_no_file {
  my $no_file=$_[0];
  print $c[2]."[!] $ZT[30] $no_file !\n"; exit();
}


1;

#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($Target, $xss, $data, $lfi, $ifinurl, $WpSites, $Hstatus, $adminPage, $subdomain, $eMails, $JoomSites, $command, $mzip, $mupload, $port, $JoomRfi, $searchIps, $mlevel, $WpAfd, $msites, $content, $ping);
our ($regex, $V_IP, $mrandom, $tcp, $udp, $dork, $motor, $searchRegex, $replace, $with, $shell, $unique, $post, $limit, $validText, $get, $config, $payloads, $exploit, $method, @TT, @SCAN_TITLE, @DT, @OTHERS, @c);

## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if (defined $Target) {
  my $Targ=Targs();
  if ($Targ<1) { print $c[4]."[!] $OTHERS[7]\n"; logoff(); }
}

if (defined $exploit or $exploit) {
  my $Targ=Targs();
  if ($Targ<1) { print $c[4]."[!] $OTHERS[7]\n"; logoff(); }
}

## CHECK TARGET PROTOCOL
if (defined $Target) {   
  if ((!-e $Target) && ($Target!~/$V_IP/) && !defined $ping) {
    if ($Target!~/https?:\/\//) { print $c[4]."[!] $DT[16]\n"; logoff(); }
  }
}

if (defined $msites) {
  if (!defined $mlevel && !$mlevel) {
    print $c[4]."[!] $DT[20]\n"; logoff();
  }
  if ((defined $Target) and (!-e $Target) && ($Target!~/$V_IP/)) { print $c[4]."[!] $Target $TT[20]\n"; logoff(); }
}


## CHECK RANDOM PARAMS
if (defined $mrandom && (!defined $mlevel && !$mlevel)) { print $c[4]."[!] $DT[38]\n"; logoff(); }

## ARGUMENTS VERIFICATION (LEVEL / PORTS)
if ((defined $dork)&&(!defined $mlevel && !$mlevel)) { print $c[4]."[!] $DT[40]\n"; logoff(); }
if ((defined $port) && (!defined $tcp and !defined $udp)) { print $c[4]."$DT[23]\n"; logoff(); }

## MORE ARGUMENTS PROCESS VERIFICATION
if ((defined $dork) || (defined $Target)) { 
  if ((defined $JoomRfi) and (!defined $shell)) { print $c[4]."[!] $DT[41]\n"; logoff(); }
  if ((defined $replace)&&(!defined $with)) { print $c[4]."[!] $DT[22]\n"; logoff(); }
}
if ((!defined $dork) && (defined $unique)) { print $c[4]."[!] $DT[21]\n"; logoff(); }
if (defined $regex or defined $eMails or defined $searchRegex or defined $searchIps) { if (defined $Hstatus) { print $c[4]."[!] $SCAN_TITLE[2]"; logoff(); } }

## CHECK MOTORS ARGUMENTS
our ($motorparam);
if (defined $motor || $motor) {
  if (defined $mrandom || $mrandom) {
    print $c[4]."$TT[14]\n"; logoff();
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
    if ($ad!~/(1|2|3|4|5|all)/) { print $c[2]."[!] $DT[25]\n".$c[4]."   $DT[27] \n   $OTHERS[5] -m 1,2,...\n"; logoff(); }
  }
}

## CHECK LEVEL
if (defined $mlevel || $mlevel) {
  if ($mlevel!~/^[0-9,.E]+$/) { print $c[4]."$TT[15]\n"; logoff(); }
}

## ADVISE DATA WITHOUT METHOD
if (defined $data and (!defined $post && !defined $get && !$method)) { print $c[4]."[!] $TT[16]\n"; logoff(); }

## CHECK PAUSE ARGUMENT
if (defined $data) {
  if ($limit<500) {
    if (!defined $Hstatus && !defined $validText) { print $c[4]."[!] $TT[17]\n"; logoff(); }
  }
}

## CHECK DATA PARAMS
if (defined $data) {
  if ($data=~/\[DATAFILE\]/) {
    my $number=()=$data=~/\[DATAFILE\]/gi;
    if ($number>1) { adviseDataFile(); }
  }
}

## IF DATA FILES > 1
sub adviseDataFile {
  print $c[2]."[!] You cannot use more than 1 wordlist!\n"; logoff();
}

## IF DATA FILE NOT EXISTS
sub advise_no_file {
  my $no_file=$_[0];
  print $c[2]."[!] Cannot whrite in $no_file !\n"; logoff();
}

## Negative scans
our $noExist;
if (defined $noExist) {
  if (!defined $Hstatus && !defined $validText && !defined $ifinurl && !defined $searchRegex){
    print $c[4]."[!] You cannot use --none command here! Use -h for help\n"; logoff();
  }  
}

1;

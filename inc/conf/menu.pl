#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex, 
     $port, $command, $data, $mmd5, $mdecode64, $mencode64, $checkVersion, $help, $toolInfo, $uninstall, $config, $ping, $mindex, 
	 $interactive, $repair, $bugtraq, $zoneH, $fullHeaders, $content, $msource, $geoloc, $getlinks, $shodan, $apikey, $exclude, 
	 $paylNote, $V_EMAIL, $V_IP, $V_REGE, $mlevel, $Target, $dork, $Hstatus, $validText, $searchRegex, $V_REGEX, $validShell);


our (@TODO, @V_WP, @V_JOOM, @XSS, @V_XSS, @LFI, @V_LFI, @E_SHELL, @ADFWP, @V_AFD, @ADMIN, @V_TODO, @SUBDOMAIN, @UPLOAD, @ZIP, 
     @SCAN_TITLE, @RFI, @c, @DT, @DS, @aTsearch); 

## DESCLAIMER
desclaimer(); 

## SUB MENU
if (defined $interactive) { interactive(); }
elsif (defined $toolInfo) { tool(); }
elsif (defined $help) { help(); }
elsif (defined $config) { userconfig(); }
elsif (defined $checkVersion) { checkVersion(); }
elsif (defined $repair) { repair(); }
elsif (defined $uninstall) { uninstall(); }
elsif (defined $mmd5) { mmd5(); }
elsif (defined $mencode64) { mencode64(); }
elsif (defined $mdecode64) { mdecode64(); }
elsif (defined $bugtraq) { bugtraq(); }
else{ if (defined $shodan) { shodan(); }

## VERIFY TARGETS AND PRESCAN
if (defined $mlevel && (!defined $shodan && !defined $bugtraq)) {
  if ((defined $dork) || (defined $Target)) {
    msearch();
  }
}

if (defined $searchRegex) { doRegex($searchRegex); }
if (scalar @aTsearch > 0) {
  my @aTsearch=checkDuplicate(@aTsearch);
  print $c[3]."[i] ".scalar @aTsearch." $DT[4]\n" if !$getlinks;
  my $k=getK(0, 0);
  if (!$k) {
    my @noresults=($command, $validShell, $validText, $zoneH, $Hstatus, $content, $msource, $fullHeaders, $geoloc, $exclude);
    my $i;
    for (@noresults) { $i="1" if defined $_; }
    if ($i) {
      ptak(); print $c[11]."[!] ";timer(); print " ::: STARTING SCAN PROCESS.. :::\n";
      makeSscan("", "", "", \@TODO, \@V_TODO, "", "", "", "", "", "", "", "", "1");
	}else{
      makeSscan("", "", "", \@TODO, \@V_TODO, "", "", "1", "", "", "", "", "", "1");
	}
  }else{
    Menu();
  }
}else{ 
  negative();
  logoff();
}

## MENU    
sub Menu {	
  if (defined $WpSites) { WpSites(); }
  if (defined $JoomSites) { JoomSites(); }
  if (defined $xss) { xss(); }
  if (defined $lfi) { lfi(); }
  if (defined $JoomRfi) { JoomRfi(); }
  if (defined $WpAfd) { WpAfd(); }
  if (defined $adminPage) { adminPage(); }
  if (defined $subdomain) { subdomain(); }
  if (defined $mzip) { zipSites(); }
  if (defined $searchIps) { Ips(); }
  if (defined $eMails) { eMails(); }
  if (defined $regex) { Regex(); }
  if (defined $port || defined $ping) { ports(); } 
  if (defined $data) { mdata(); }
  }
}

## GET WORDPRESS SITES
sub WpSites { makeSscan("3", "", "", \@TODO, \@V_WP, $SCAN_TITLE[3], "", "", "", "", "", "1", "", ""); }

## GET WORDPRESS SITES
sub JoomSites { makeSscan("3", "", "", \@TODO, \@V_JOOM, $SCAN_TITLE[4], "", "", "", "", "", "1", "", ""); }

## XSS
sub xss { makeSscan("3", "", "", \@XSS, \@V_XSS, $SCAN_TITLE[5], $paylNote, "", "", "", "", "1", "", ""); }

## LFI
sub lfi { makeSscan("3", "", "", \@LFI, \@V_LFI, $SCAN_TITLE[6], $paylNote, "", "", "", "", "1", "", ""); }

## RFI JOOMLA
sub JoomRfi { makeSscan("3", "4", "", \@RFI, \@E_SHELL, $SCAN_TITLE[7], $paylNote, "", "", "", "", "1", "", ""); restaureSearch(); }

## WORDPRESS ADF
sub WpAfd { makeSscan("3", "4", "", \@ADFWP, \@V_AFD, $SCAN_TITLE[8], $paylNote, "", "", "", "", "1", "", ""); restaureSearch(); }

## GET ADMIN PAGE
sub adminPage { makeSscan("3", "4", "", \@ADMIN, \@V_TODO, $SCAN_TITLE[9], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }

## GET SUBDOMAINS
sub subdomain { makeSscan("3", "4", "5", \@SUBDOMAIN, \@V_TODO, $SCAN_TITLE[10], $paylNote, "", "1", "", "", "", "", ""); restaureSearch(); }

## GET ZIP FILES
sub zipSites { makeSscan("3", "4", "", \@ZIP, \@V_TODO, $SCAN_TITLE[12], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }

## GET IPS
sub Ips { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[21], "", "", "", $V_IP, "", "", "", ""); }

## GET E-MAILS
sub eMails { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[13], "", "", "", $V_EMAIL, "", "", "", ""); }

## GET REGEX
sub Regex { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[22], "", "", "", $V_REGEX, "", "", "", ""); }

## FORM BY POST
sub mdata { makeSscan("3", "", "", \@TODO, \@V_TODO, "DATA", "", "", "", "", "", "", "$data", ""); }

## MD5 ENCODE
sub mmd5 { scanCode($SCAN_TITLE[17], $mmd5, "1", "", ""); } 

## ENCODE BASE 64
sub mencode64 { scanCode($SCAN_TITLE[18], $mencode64, "", "1", ""); }

## DECODE BASE 64
sub mdecode64 { scanCode($SCAN_TITLE[19], $mdecode64, "", "", "1"); }

## UPDATE SUCCESS
sub updtd {}

## USER CONFIGURATION
sub userconfig { require "$Bin/inc/functions/userConfig.pl"; }

## TOOL UPDATE ###
sub checkVersion { require "$Bin/inc/functions/checkVersion.pl"; }

## TOOL REPAIR
sub repair { require "$Bin/inc/conf/repair.pl"; }

## INFO TOOL #####
sub tool { require "$Bin/inc/functions/tool.pl"; }

## DELETE / UNINSTALL TOOL 
sub uninstall { require "$Bin/inc/functions/uninstall.pl"; }

## HELP MENU #####
sub help { require "$Bin/inc/help.pl"; }

## INTERACTIVE MENU
sub interactive { require "$Bin/inc/interactive/main.pl"; }

## BUGTRAQ
sub bugtraq { require "$Bin/inc/functions/bugtraq.pl"; }

## SHODAN
sub shodan { require "$Bin/inc/functions/shodan.pl"; }

1;

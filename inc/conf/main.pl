#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@TODO, @V_WP, @V_JOOM, @XSS, @V_XSS, @LFI, @V_LFI, @E_SHELL, @ADFWP, @V_AFD, @ADMIN, @V_TODO, @SUBDOMAIN, @UPLOAD, @ZIP, @SCAN_TITLE, @RFI, @c, @DT); 
our ($paylNote, $V_EMAIL, $V_IP, $V_REGEX, $command, $mmd5, $mencode64, $mdecode64, $mlevel, $Target, $dork, $noExist, $Hstatus, $validText);

## PRINT ENGINE RESULTS
sub printSearch {
  my $motor=$_[0];
  our ($searchRegex, @aTsearch, @c, @DT, @TODO, @V_TODO);
  if (defined $searchRegex) { doRegex($searchRegex); }
  if (scalar(grep { defined $_} @aTsearch)>0) {
    my @aTsearch=checkDuplicate(@aTsearch);
    print $c[3]."[i] ".scalar(grep { defined $_} @aTsearch)." $DT[4]\n";
    my $k=getK(0, 0);
    if (!$k) {
      if (defined $noExist || defined $Hstatus || defined $validText) {
        ptak(); print $c[11]."[!] ";timer(); print " ::: STARTING VALIDATION PROCESS SCAN.. :::\n";
      }
      makeSscan("", "", "", \@TODO, \@V_TODO, "", "", "1", "", "", "", "", "", "1");
    }
  }else{ negative(); logoff(); }
  Menu();
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

## GET UPLOAD FILES
sub uploadSites { makeSscan("3", "4", "", \@UPLOAD, \@V_TODO, $SCAN_TITLE[11], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }

## GET ZIP FILES
sub zipSites { makeSscan("3", "4", "", \@ZIP, \@V_TODO, $SCAN_TITLE[12], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }

## GET IPS
sub Ips { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[21], "", "", "", $V_IP, "", "", "", ""); }

## GET E-MAILS
sub eMails { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[13], "", "", "", $V_EMAIL, "", "", "", ""); }

## GET REGEX
sub Regex { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[22], "", "", "", $V_REGEX, "", "", "", ""); }

## FORM BY POST
sub mdata { makeSscan("3", "", "", \@TODO, \@V_TODO, "DATA", "", "", "", "", "", "", "10", ""); }

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

## INFO TOOL #####
sub tool { require "$Bin/inc/functions/tool.pl"; }

## DELETE / UNINSTALL TOOL 
sub uninstall { require "$Bin/inc/functions/uninstall.pl"; }

## HELP MENU #####
sub help { require "$Bin/inc/help.pl"; }

## INTERACTIVE MENU
sub interactive { require "$Bin/inc/interactive/main.pl"; }

1;

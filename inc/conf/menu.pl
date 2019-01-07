#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex, $port, $command, $data, $mmd5,
     $mdecode64, $mencode64, $checkVersion, $help, $toolInfo, $uninstall, $config, $ping, $interactive, $repair, $bugtraq, $zoneH, $fullHeaders, $content, $msource);

## VERIFY TARGETS AND PRESCAN
our ($mlevel, $Target, $dork, @c, @DS, @DT, @TODO, @V_TODO, @SCAN_TITLE, @aTsearch);
if (defined $mlevel) {
  if ($mlevel < 10) { print $c[4]."[!] $DT[26]\n"; logoff(); }
  if ((defined $dork) || (defined $Target)) { desclaimer(); msearch(); }
}else{
  if (defined $Target) {
    desclaimer(); my $k=getK(0, 0);    
    if (!$k) {
      my @noresults=($zoneH, $fullHeaders, $content, $msource, $zoneH, $command);
      my $i;
      for (@noresults) { $i="1" if defined $_; }
      if ($i) {
        makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[1], "", "1", "", "", "", "", "", "");
      }else{
        makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[1], "", "", "", "", "", "", "", "");
      }
    }else{
      Menu();
    }
  }
}

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

if (defined $mmd5 || defined $mencode64 || defined $mdecode64) {
  desclaimer();
  if (defined $mmd5) { mmd5(); }
  if (defined $mencode64) { mencode64(); }
  if (defined $mdecode64) { mdecode64(); }
}

my @noresults2=($checkVersion, $help, $bugtraq, $repair, $toolInfo, $uninstall, $config, $interactive);
my $i2;
for (@noresults2) { $i2="1" if defined $_; }
if ($i2) {
  desclaimer();
  if (defined $checkVersion) { checkVersion(); }
  if (defined $repair) { repair(); }
  if (defined $help) { help(); }
  if (defined $toolInfo) { tool(); }
  if (defined $bugtraq) { bugtraq(); }
  if (defined $uninstall) { uninstall(); }
  if (defined $config) { userconfig(); }
  if (defined $interactive) { interactive(); }
}

1;

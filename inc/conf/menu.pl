#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex, $port, $command, $data, $mmd5,
     $mdecode64, $mencode64, $checkVersion, $help, $toolInfo, $uninstall, $config, $ping, $interactive);

## VERIFY TARGETS AND PRESCAN
our ($mlevel, $Target, $dork, @c, @DS, @DT, @TODO, @V_TODO, @SCAN_TITLE, @aTsearch);
if (defined $mlevel) {
  if ($mlevel < 10) { print $c[4]."[!] $DT[26]\n"; logoff(); }
  if ((defined $dork) || (defined $Target)) { desclaimer(); msearch(); }
}else{
  if (defined $Target) {
    desclaimer(); my $k=getK(0, 0);    
    if (!$k) {
      if (defined $command) {
        scanTitleBgn(); print $c[11]."$SCAN_TITLE[16]"; scanTitleEnd();
        my $count=0;
        my $lc=scalar(grep { defined $_} @aTsearch);
        for my $URL(@aTsearch) {
          $count++;
          print "\n" if $count>1;
          points(); dpoints(); points();
          print $c[1]."    $DS[9]  ".$c[7]."[$count/$lc] $URL\n";
          print $c[1]."    $DT[24]  $c[10]....................................................................\n";
          getComnd($URL, $command);
        }
        ltak();
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
  if (defined $mupload) { uploadSites(); }
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
if (defined $checkVersion || defined $help || defined $toolInfo || defined $uninstall || defined $config || defined $interactive) {
  desclaimer();
  if (defined $checkVersion) { checkVersion(); }
  if (defined $help) { help(); }
  if (defined $toolInfo) { tool(); }
  if (defined $uninstall) { uninstall(); }
  if (defined $config) { userconfig(); }
  if (defined $interactive) { interactive(); }
}

1;

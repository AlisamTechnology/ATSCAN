#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## CHECK CONNECTION
sub testConnection { 
  our ($proxy, $prandom, $psx, @ErrT, @c, @DT, $ipUrl);
  if (defined $proxy || defined $prandom) { print $c[4]."[!] $DT[31]\n".$c[4]."[!] $ErrT[20] [$psx].. "; UA(); }
  my ($response, $html, $status, $serverheader)=getHtml($ipUrl, "");
  if (!$response->is_success) {
    print $c[4]."\n[!] $ErrT[23]\n".$c[2]."[!] $DT[11]\n[!] $DT[10]\n"; logoff();
  }else{
    if (defined $proxy || defined $prandom) { print $c[3]."[!] OK!\n"; ltak(); sleep(1); }    
  }
}

1;

#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## GET NEW IDENTITY
sub newIdentity {
  our ($proxy, $prandom, $psx, $V_IP, $ipUrl, $noinfo, @proxies, @ErrT, @DT, @c);
  if ((defined $proxy && $proxy=~/(localhost|127.0.0.1)/) || (defined $prandom && $prandom=~/(localhost|127.0.0.1)/)) {
    system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;"); }
  else{ my $psx=$proxies[rand @proxies]; UA(); }
  my ($response, $html, $status, $serverheader)=getHtml($ipUrl, "");
  if ($response->is_success) { 
    if (!defined $noinfo) { 
	  if ($response->content=~m/$V_IP/g) { my $ipadress="$1"; print $c[1]."    $ErrT[21] $c[8]  $ErrT[22] ::: $ipadress :::\n"; }
	}
  }
  else{ ltak(); print $c[4]."[!] $DT[30] [$psx]!\n"; logoff(); }
}

1;

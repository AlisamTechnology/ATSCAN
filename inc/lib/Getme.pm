package Getme;

use FindBin '$Bin';
use strict;
use IO::Socket::INET;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
use URI::Escape;
use HTML::Entities;
use HTTP::Request::Common;
use Net::Ping;
use Print;
use open ':std', ':encoding(UTF-8)';

## Copy@right Alisam Technology see License.txt

##########################################################################################################
## CONSTRUCTOR
sub new {
  my $self = {};
  $self->{ navget };
  $self->{ navpost };
  $self->{ navdatapost };
  $self->{ navsearch };
  bless $self, 'Getme';
  return $self;
}

## GET NEW PROXY
sub newpsx {
  my ($self, $ua, $freq, $start, $v_proxies, $freq, $start, $psx, $prandom) = @_;
  my @v_proxies = @{ $v_proxies };
  my @c = Print::colors();
  my @ErrT = Exploits::ErrT();
  my @ZT = Exploits::ZT();

  my $yes = 1;
  if (defined $freq) { $yes = Subs::make_freq($freq, $start); }
  if ($yes && (defined $prandom)) {
    if ((scalar @v_proxies) eq 1) {
      if ($psx=~/(localhost|127.0.0.1)/) {
	    my $x=0;
	    while (!$x) {
          system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;");
		  use Connect;
	      my $r = Connect::check_proxy_connect($ua, $psx);
	      if ($r) {
		    $x++;
		    print $c[1]." $ErrT[21]   $c[8]  $ZT[24] [$r]\n";
		  }
	    }
	  }
    }else{
	  my $newpsx = $psx;
	  $psx = $v_proxies[rand @v_proxies] while $psx eq $newpsx;
    }
  }else{
    $psx = $psx;
  }
  my $psx1 = $v_proxies[rand @v_proxies];
  my $psx = $v_proxies[rand @v_proxies] while $psx eq $psx1;
  $self->{newpsx} = $psx;
}

##########################################################################################################
##
sub get_resut {
  my ($re, $fullHeaders) = @_;
  my $ht = $re->decoded_content;   ## html
  my $st = $re->code;              ## response code
  my $sh = $re->server;            ## server
  my $fh = $re->headers_as_string; ## full headers

  if (defined $fullHeaders) {
    my $Hcopy="$Bin/inc/user/HeadersTemp.txt";
    Print::printFile($Hcopy, $fh);
  }
  return ($ht, $st, $sh, $fh);
}

##########################################################################################################
sub navsearch {
  my ($self, $ua, $engine, $fullHeaders) = @_;
  my $re = $ua->get($engine) or Print::advise_connect();
  my $redir = $re->request->uri if ($re->previous);
  my ($ht, $st, $sh, $fh) = get_resut($re, $fullHeaders);
  $self->{ navsearch } = $ht if $st eq 200;
  return $self->{ navsearch };
} 

##########################################################################################################
sub navget {
  my ($self, $ua, $url, $fullHeaders, $post, $get) = @_;  
  my $re = $post ? $ua->post($url) : $ua->get($url);
  my $redir = $re->request->uri if ($re->previous);
  my ($ht, $st, $sh, $fh) = get_resut($re, $fullHeaders);
  return ($redir, $re, $ht, $st, $sh, $fh) if $st;
} 

##########################################################################################################
## ZONE-H DATA
sub navpost {
  my ($self, $ua, $zoneH, $url, $fullHeaders) = @_;
  $url=~s/\s//ig;
  my $re = $ua->post("http://www.zone-h.org/notify/single",
                       Content => ['defacer' => $zoneH,
				                   'domain1' => $url,
				                   'hackmode' => '18',
				                   'reason' => '1',
				                   'Gönder' => 'Send',
				                  ]);
  my ($ht, $st, $sh, $fh) = get_resut($re, $fullHeaders);  
  $self->{ navpost } = $ht if $ht;
  return $self->{ navpost };
}

##########################################################################################################
## ZONE-H DATA
sub navdatapost {
  my ($self, $ua, $get, $post, $url, $data, $fullHeaders) = @_;
  $url=~s/\s//ig;
  my $re = $ua->post($url,
                       Content_Type => 'multipart/form-data', 
					   Content => [$data]);					   
  my ($ht, $st, $sh, $fh) = get_resut($re, $fullHeaders);  
  $self->{ navdatapost } = $st if $st eq 200;
  return $self->{ navdatapost };
}

##########################################################################################################

1;
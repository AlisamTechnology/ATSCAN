package Getagent;

use FindBin '$Bin';
use strict;
use Print;
use Exploits;
use Subs;

## Copy@right Alisam Technology see License.txt

##########################################################################################################
## CONSTRUCTOR
sub new {
  my $self = {};
  $self->{ get_agent };
  $self->{ get_ua };
  
  bless $self, 'Getagent';
  return $self;
}

my @c = Print::colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @OTHERS = Exploits::OTHERS();

###################################################################################################################################
## BROWSER RANDOM
sub get_sys {
  my @strings=('ar_JO', 'ar_KW', 'ar_LB', 'ar_LY', 'ar_MA', 'ar_OM', 'ar_QA', 'ar_SA', 'ar_SD', 'el_GR', 'el', 'iw_IL', 'iw', 'hi_IN', 'hu_HU', 'hu', 'is_IS', 'is', 'in_ID', 'cs-CZ', 'uk',
             'vi_VN', 'vi', 'en-US', 'sk-SK', 'pt-BR', 'sq_AL', 'sq', 'ar_DZ', 'ar_BH', 'ar_EG', 'ar_IQ', 'be_BY', 'be', 'bg_BG', 'bg', 'ca_ES', 'ca', 'zh_CN', 'zh_HK', 'zh_SG', 'zh_TW',
             'zh', 'hr_HR', 'hr', 'cs_CZ', 'cs', 'da_DK', 'da', 'nl_BE', 'nl_NL', 'nl', 'en_AU', 'en_CA', 'en_IN', 'en_IE', 'en_MT', 'en_NZ', 'en_PH', 'en_SG', 'en_ZA', 'en_GB', 'en_US',
             'en', 'et_EE', 'et', 'fi_FI', 'fi', 'fr_BE', 'fr_CA', 'fr_FR', 'fr_LU', 'fr_CH', 'fr', 'de_AT', 'de_DE', 'de_LU', 'de_CH', 'de', 'el_CY', 'in', 'ga_IE', 'ga', 'it_IT', 'it_CH',
             'it', 'ja_JP', 'ja_JP_JP', 'ja', 'ko_KR', 'ko', 'lv_LV', 'lv', 'lt_LT', 'lt', 'mk_MK', 'mk', 'ms_MY', 'ms', 'mt_MT', 'mt', 'no_NO', 'no_NO_NY', 'no', 'pl_PL', 'pl', 'pt_PT',
             'pt', 'ro_RO', 'ro', 'ru_RU', 'ru', 'sr_BA', 'sr_ME', 'sr_CS', 'sr_RS', 'sr', 'sk_SK', 'sk', 'sl_SI', 'sl', 'es_AR', 'es_BO', 'es_CL', 'es_CO', 'es_CR', 'es_DO', 'es_EC',
             'es_SV', 'es_GT', 'es_HN', 'es_MX', 'es_NI', 'es_PA', 'es_PY', 'es_PE', 'es_PR', 'es_ES', 'es_US', 'es_UY', 'es_VE', 'es', 'sv_SE', 'sv', 'th_TH', 'th_TH_TH', 'th', 'tr_TR',
             'tr', 'uk_UA', 'uk');

  my @vary=("Firefox","Opera", "SeaMonkey", "Safari", "Dragon", "GNU IceCat", "Seamonkey", "Galaxy", "GoogleBot", "Tor Browser", "Konqueror", "Flock", "Chrome", "Mobile");
  
  my @systems=(
          "Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0;.NET CLR 2.0.50727; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.1; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1; $strings[rand @strings];) $vary[rand @vary]",
          "Mozilla/5.0 (compatible; Konqueror/3.5; $strings[rand @strings]; SunOS) $vary[rand @vary]",
          "Mozilla/5.0 (compatible; Konqueror/3.5; $strings[rand @strings]; NetBSD 4.0_RC3; X11; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; $strings[rand @strings]; rv:21.0) $vary[rand @vary]",
      	  "Macintosh; Intel Mac OS X 10_9_0; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (X11; Linux 3.5.4-1-ARCH i686; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Linux; U; Android 4.2.2; $strings[rand @strings]; LNV-Lenovo K910e/S100; 1080*1920; CTC/2.0;) $vary[rand @vary]",
          "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Windows NT 5.1; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Windows; I; Windows NT 5.1; $strings[rand @strings]; rv:1.9.2.13) $vary[rand @vary]",
          "Mozilla/5.0 (Windows NT 6.1; $strings[rand @strings]; rv:24.0) $vary[rand @vary]",
          "Mozilla/5.0 (Windows NT 6.1; WOW64; $strings[rand @strings]) $vary[rand @vary]",
          "Mozilla/5.0 (Windows NT 6.2; WOW64; $strings[rand @strings]; rv:16.0.1) $vary[rand @vary]",
          "Mozilla/5.0 (Windows 2000; WOW64; $strings[rand @strings]; rv:16.0.1) $vary[rand @vary]",
          "Mozilla/5.0 (Windows 98; WOW64; $strings[rand @strings]; rv:16.0.1) $vary[rand @vary]",
          "Mozilla/5.0 (Windows 95; WOW64; $strings[rand @strings]; rv:16.0.1) $vary[rand @vary]"
          );
   return @systems;
}

##########################################################################################################
## SET AGENT
sub get_agent {
  my ($self, $freq, $start, $agent) = @_;
  my $yes = 1;
  my @systems = get_sys();
  $agent = "Mozilla/5.0 (".$systems[rand @systems] if !$agent;
  if (defined $freq) { $yes = Subs::make_freq($freq, $start); }
  my $current = $agent;
  my $newagent = "Mozilla/5.0 (".$systems[rand @systems] unless ($current ne $agent);
  
  $agent = $yes ? $newagent : $current;
  $self->{ get_agent } = $agent if defined $agent;
  return $self->{ get_agent };
}

##########################################################################################################
## GET UA
sub get_ua {
  my ($self, $agent, $timeout, $headers, $cookies) = @_; 
  my $ua = LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
  $ua->cookie_jar($cookies);
  $ua->env_proxy;
  if (defined $timeout || $timeout) {
    $ua->timeout($timeout);
    if (defined $headers) {
      my @defaultHeaders=split (",", $headers);
      foreach my $hdr(@defaultHeaders) {
        $ua->push_header($hdr);
	  }
    }
  }
  $self->{ get_ua } = $ua if $ua;
  return $self->{ get_ua };
}

##########################################################################################################
## USE PROXY
sub use_proxy {
  my ($self, $freq, $start, $ua, $v_proxies, $prandom, $prnt) = @_;
  my @v_proxies = @{$v_proxies};
  my $psx = $v_proxies[rand @v_proxies];
  my $scalar = scalar @v_proxies;
  
  my $yes = 1;
  if (defined $freq) { $yes = make_freq($freq, $start); }
  if ($yes && (defined $prandom)) {
    if ($scalar eq 1) {
      if ($psx=~/(localhost|127.0.0.1)/) {
	    my $x=0;
	    while (!$x) {
          system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;");
		  use Connect;
		  
	      my $r = Connect::check_proxy_connect($ua, $psx);
	      if ($r) {
		    $x++;
		    print $c[1]." $ErrT[21]   $c[8]  $ZT[24] [$r]\n" if $prnt;
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
  $ua->proxy([qw/ http https ftp ftps /] => $psx); $ua->cookie_jar({ });
  $self->{ use_proxy } = $ua if ($scalar > 0); 
  return $self->{ use_proxy };
}

##########################################################################################################

1;
package Search;

use URI::Escape;
use HTML::Entities;
use strict;
use Exploits;
use Subs;
use Target;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(msearch doDeepSearch);

##########################################################################################################
## FILTER SEARCH RESULTS
my $nolisting="q=|0day|pastebin|\/\/t.co|google.|youtube.|jsuol.com|.radio.uol.|b.uol.|barra.uol.|whowhere.|hotbot.|amesville.|lycos|lygo.|orkut.|schema.|blogger.|bing.|w3.|yahoo.|yimg.|
                creativecommons.org|ndj6p3asftxboa7j.|.torproject.org|.lygo.com|.apache.org|live.|microsoft.|ask.|shifen.com|answers.|analytics.|googleadservices.|sapo.pt|favicon.|
                blogspot.|wordpress.|.css|scripts.js|jquery-1.|dmoz.|gigablast.|aol.|.macromedia.com|.sitepoint.|yandex.|www.tor2web.org|.securityfocus.com|.Bootstrap.|.metasploit.com|
                aolcdn.|altavista.|clusty.|teoma.|baiducontent.com|wisenut.|a9.|uolhost.|w3schools.|msn.|baidu.|hao123.|shifen.|procog.|facebook.|twitter.|flickr.|.adobe.com|oficinadanet.|
                elephantjmjqepsw.|.duckduckgo.io|kbhpodhnfxl3clb4|.scanalert.com|.prototype.|feedback.core|4shared.|.KeyCodeTab|.style.|www\/cache\/i1|.className.|=n.|a.Ke=|Y.config|
                .goodsearch.com|style.top|n.Img|n.canvas.|t.search|Y.Search.|a.href|a.currentStyle|a.style|yastatic.|.oth.net|.hotbot.com|.zhongsou.com|ezilon.com|.example.com|location.href|
                .navigation.|.hostname.|.bingj.com|Y.Mobile.|srpcache?p|stackoverflow.|shifen.|baidu.|baiducontent.|gstatic.|php.net|wikipedia.|webcache.|inurl.|naver.|navercorp.|windows.|
                window.|.devmedia|imasters.|.inspcloud.com|.lycos.com|.scorecardresearch.com|.target.|JQuery.min|Element.location.|document.|exploit-db|packetstormsecurity.|1337day|owasp|
                .sun.com|mobile10.dtd|onabort=function|inurl.com.br|purl.org|.dartsearch.net|r.cb|.classList.|.pt_BR.|github|microsofttranslator.com|.compete.com|.sogou.com|gmail.|blackle.com|
                boorow.com|gravatar.com|cookieSet|security|facebook|WindowsLiveTranslator|cache|74.125.153.132|inurl:|Network|adw.sapo|tripadvisor|yandex|Failed|tumblr.|wiki|inciclopedia.|
                sogoucdn.com|weixin.|snapshot.|cxsecurity.|whois.|exalead.|3ds.|linkedin.|&FORM=PERE|cache:|cache+|googleapis|tripadvisor.|javascript:void|\"title";

my $V_SEARCH = Exploits::V_SEARCH();

## SEARCH
sub msearch {
  my ($ua, $dork, $Target, $mlevel, $dorks, $motors, $v_apikey, $cx, $zone, $unique, $ifinurl, $searchRegexs, $agent, $timeout, $headers, $cookies, $fullHeaders) = @_;
  my (@aTsearch, @aTsearchs);
  my $level = $mlevel * 10;
  for my $engine(@{$motors}) {
    if ($engine =~ /MYAPIKEY/) {
    $engine =~ s/MYAPIKEY/$v_apikey/;
	$engine =~ s/MYCX/$cx/g;
    }

	my @engParts = split("MYDORK", $engine);
    for (@{$dorks}) {
	  $_ = takeZone($_, $zone);
      if (length $_ > 0) {
        my $dorkTaken = $engParts[0];
		$dorkTaken .= $_;
		$dorkTaken .= $engParts[1];		
		
		my @dorkTaken = split("MYNPAGES", $dorkTaken);
        for(my $npages=1;$npages<=$level;$npages+=10) {
          my $numPgs = $dorkTaken[0];
		  $numPgs .= $npages;
		  $numPgs .= $dorkTaken[1];
		  
		  my $getme = new Getme();		  
		  my $res = $getme->navsearch($ua, $numPgs, $fullHeaders);
		  if ($numPgs =~ /googleapis./) {
            @aTsearchs = doSearchApis($res, $_, $numPgs, $unique, $ifinurl, \@{$searchRegexs});  
		  }else{
            @aTsearchs = doSearch($res, $_, $numPgs, $unique, $ifinurl, \@{$searchRegexs});  
		  }
		  push @aTsearch, @aTsearchs;
        }
      }
    }
  }  
  return \@aTsearch;
}

###############################################################################################################
#########################################################################################################################
## ZONE
sub takeZone {
  my ($dk, $zone) = @_;
  if ($dk =~/^(http|www)/) {
	my $ut = new Target();
    $dk = $ut->cleanURL($dk);
    $dk = "site%3A".$dk;
  }
  if ($zone) { $dk = "site%3A$zone ".$dk; }
  $dk =~ s/\s+$//;
  $dk =~ s/ /+/g;
  $dk =~ s/^(\+|\s+)//g;
  return $dk
}	

###############################################################################################################
#########################################################################################################################
## GET URLS FROM SEARCH ENGINE PAGES
sub doSearch {
  my ($Res, $drk, $motor, $unique, $ifinurl, $searchRegexs) = @_;
  my @aTsearchs;
  while($Res =~ /$V_SEARCH/g) {
    my $URL = $1;
	$URL =~ s/(\&sa=|\&ved=|\&amp\;).*//;
	if ((substr $URL, -1) ne "-" && (substr $URL, -1) ne "."){
      $URL = do_needed($URL, $drk, $unique, $ifinurl, \@{$searchRegexs}) if ($URL !~/\.\./);
	  push @aTsearchs, $URL if $URL;
	}
  }
  return @aTsearchs;
}

#########################################################################################################################
## SEARCH REGEX
sub checkSearchRegex {
  my ($u, $searchRegexs) = @_;
  my $vu;
  for (@{$searchRegexs}) {
    if ($u =~ /$_/g) {
	  $vu = $u; last;
	}
  }
  return $vu;
}

#########################################################################################################################
## GET URLS FROM GOOGLE APIS ENGINE PAGES
sub doSearchApis {
  my ($Res, $drk, $motor, $unique, $ifinurl, $searchRegexs) = @_;
  my @aTsearch;
  if ($Res) {
    $Res = Subs::_json($Res);
    my @found = @{ $Res->{'items'} };
    for (@found) {
	  my $link = $_->{'link'};
	  $link = do_needed($link, $drk, $unique, $ifinurl, $searchRegexs) if $link;
	  push @aTsearch, $link if $link;
	}
  }
  return @aTsearch;
}
  
#########################################################################################################################
## EXTRAT CONDITIONS
sub do_needed {
  my ($URL, $drk, $unique, $ifinurl, $searchRegexs) = @_;
  my $url;
  utf8::encode($URL);
  $URL = uri_unescape($URL);
  $URL=decode_entities($URL);
  $URL=~s/<.*//s;
  if ($URL!~/$nolisting/) {
    if (defined $unique || defined $ifinurl || $unique) {
      my $dorkToCheeck = Subs::checkFilters($drk);
      $URL = Subs::filterUr($URL, $dorkToCheeck, $unique, $ifinurl);
    }
	my $vURL;
	if (scalar @{$searchRegexs} > 0) {
	  for (@{$searchRegexs}) {
	    if ($URL =~ /$_/) {
		  $vURL = $URL;
		}
	  }
	}else{
	  $vURL = $URL;
	}
	
    my $vURL2 = Subs::validateURL($URL);
    if ($vURL2) {
      $url = $URL;
    }
  }
  return $url;
}

############################################################################################################
## DEEP SEARCH
sub doDeepSearch {
  my ($targets, $ua, $fullHeaders, $post, $get) = @_;  
  my $nodeeplisting="q=|.png|.jepg|.css|.js|jpg|.xml|utm_|doubleclick.|ie=UTF";
  my @deep;  
  Print::print_general("4", "[!] Scraping engine targets...");
  for (@{$targets}) {
    my $getme = new Getme;
    my ($redir, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $_, $fullHeaders, $post, $get);
    while ($ht =~m/href=\"([^>\"\<\'\(\)\#\,\s]*)/g) {
	  my $llk=$1;
	  if ($llk!~/$nolisting/ and $llk!~/$nodeeplisting/) {
	    if ($llk!~/^https?:\/\//) { 
		  $llk="$_/$llk";
        } 
        my $cllk=$llk;
	    $llk=Subs::removeProtocol($llk);
	    $llk=~s/\/\//\//;
	   if ($cllk=~/^https/) {
		  $llk="https://$llk";
	    }else{
		  $llk="http://$llk";
	    }
		my $vURL = Subs::validateURL($llk);
	    if ($vURL) { push @deep, $llk; }
	  }
    }
  }
  
  
  @deep = Subs::checkDuplicate(@deep);
  return \@deep;
}

##########################################################################################################

1;


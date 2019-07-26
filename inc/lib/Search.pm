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
                sogoucdn.com|weixin.|snapshot.|cxsecurity.|whois.|exalead.|3ds.|linkedin.|&FORM=PERE|cache:|cache+|googleapis|tripadvisor.|javascript:void";

my $V_SEARCH = Exploits::V_SEARCH();

##########################################################################################################
## SEARCH
sub msearch {
  my ($ua, $dork, $Target, $mlevel, $dorks, $motors, $v_apikey, $cx, $zone, $unique, $ifinurl, $searchRegexs, $agent, $timeout, $headers, $cookies, $fullHeaders) = @_;
  my @aTsearch;
  my $level = $mlevel * 10;
  for my $engine(@{$motors}) {
    for my $drk(@{$dorks}) {
	  if ($drk =~ /^(http|www)/) {
		my $ut = new Target();
        $drk = $ut->cleanURL($drk);
		$drk = "site%3A".$drk;
      }
      if ($zone) { $drk = "site%3A$zone ".$drk; }
      $drk =~ s/\s+$//;
      $drk =~ s/ /+/g;
      $drk =~ s/^(\+|\s+)//g;
      if (length $drk > 0) {      
        $engine =~ s/MYDORK/$drk/g;
        for(my $npages=1;$npages<=$level;$npages+=10) {
          $engine =~ s/MYNPAGES/$npages/g;
          if ($engine =~ /MYAPIKEY/) {
            $engine =~ s/MYAPIKEY/$v_apikey/;
			$engine =~ s/MYCX/$cx/g;
          }
		  		  
		  my $getme = new Getme();		  
		  my $res = $getme->navsearch($ua, $engine, $fullHeaders);
		  if ($engine =~ /googleapis./) {
            @aTsearch = doSearchApis($res, $drk, $engine, $unique, $ifinurl, \@{$searchRegexs});  
		  }else{
            @aTsearch = doSearch($res, $drk, $engine, $unique, $ifinurl, \@{$searchRegexs});  
		  }
          $engine =~ s/=$npages/=MYNPAGES/ig;
        }
        $engine =~ s/\Q$dork/MYDORK/ig;
      }
    }
  }  
  return \@aTsearch;
}

#########################################################################################################################
## GET URLS FROM SEARCH ENGINE PAGES
sub doSearch {
  my ($Res, $drk, $motor, $unique, $ifinurl, $searchRegexs) = @_;
  my @aTsearch;
  while($Res =~ /$V_SEARCH/g) {
    my $URL = $1;
	$URL =~ s/(\&sa=|\&ved=|\&amp\;).*//;
	if ((substr $URL, -1) ne "-"){
      $URL = do_needed($URL, $drk, $unique, $ifinurl, \@{$searchRegexs}) if ($URL !~/\.\./);
	  push @aTsearch, $URL if $URL;
	}
  }
  return @aTsearch;
}

#########################################################################################################################
## SEARCH REGEX
sub checkSearchRegex {
  my ($u, $searchRegexs) = @_;
  my $vu;
  for my $reg(@{$searchRegexs}) {
    if ($u =~ /$reg/g) {
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
  $Res = Subs::_json($Res);
  my @found = @{ $Res->{'items'} };
  for my $found(@found) {
	my $link = $found->{'link'};
	$link = do_needed($link, $drk, $unique, $ifinurl, $searchRegexs) if $link;
	push @aTsearch, $link if $link;
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
	  for my $reg(@{$searchRegexs}) {
	    if ($URL =~ /$reg/) {
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
  for my $link(@{$targets}) {
    #if (substr($link, -1) eq "\/") { $link=chop($link); }
    my $getme = new Getme;
    my ($redir, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $link, $fullHeaders, $post, $get);
    while ($ht =~m/href=\"([^>\"\<\'\(\)\#\,\s]*)/g) {
	  my $llk=$1;
	  if ($llk!~/$nolisting/ and $llk!~/$nodeeplisting/) {
	    if ($llk!~/^https?:\/\//) { 
		  $llk="$link/$llk";
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


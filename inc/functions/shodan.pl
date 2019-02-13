#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';

checkCpanModules();	
use JSON;	
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## SHODAN

our($ua, $limit, $shoapikey, $shoip, $shocount, $shosearch, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, 
    $shoreverse, $shomyip, $shoapiInfo, $shofilters, $shoports, $shoprotos, $shotokens, $facets, $pages, $output, $V_IP, $V_RANG, $command, @c);
		
my $nn=0;
my $noshodanres="No results found|Invalid IP";
my $base="https://api.shodan.io";
my @sho_scans=($shoip, $shocount, $shosearch, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, $shoreverse, 
               $shomyip, $shoapiInfo, $shotokens, $shoports, $shoprotos);
$facets="" if !$facets;
$pages=1 if !$pages;

###########################################################################################
## GET HOST IP  ###########################################################################
sub getshodanip {
  my $f=$_[0];
  my $ff;
  my $getf=checkExtraInfo($f);
  if ($getf) { $ff=inet_ntoa($getf); }
  return $ff;
}

###########################################################################################
## VALIDATION  ############################################################################
sub check_host_validation {
  my ($f, $nn, $sub)=@_;
  my $valid_f;
  if ( $f =~ /^$V_IP$/ ) {
    $valid_f=$f;
  }else{
	$f=getshodanip($f);
	if ($f) { $valid_f=$f; }
  }
  if ($valid_f) { 
	sho_ip($f, $nn) if $sub eq 1;
	sho_dns_resolve($f, $nn) if $sub eq 2;
	sho_dns_reverse($f, $nn) if $sub eq 3;
	sho_tokens($f, $nn) if $sub eq 4;
  }else{ 
	invalid();
  }
}
###########################################################################################
## INVALID HOST  ##########################################################################
sub invalid {
  print $c[2]."[!] Invalid host or IP! \n";
}
###########################################################################################
## NO RESULTS  ############################################################################
sub no_Result {
  my $val=$_[0];
  print $c[2]."[!] No results found for [$val] !\n";  
}

###########################################################################################
## RESULTS LIMIT ##########################################################################
sub adviseLimit {
  if ($limit eq 500) {
    print $c[4]."[!] Use --limit to set number of results! ex: --limit 10\n";
    sleep 1;
  }
}

###########################################################################################
## RESULTS PAGES  #########################################################################
sub advisePages {
  print $c[4]."[!] Use --pages <number pages> to get more page results! ex: --pages 2 \n";
  sleep 1;
}

###########################################################################################
## GET RESULTS  ###########################################################################
sub getShoResults {
  my $u=$_[0];
  ckeck_ext_founc("");
  return $ua->get($u)->decoded_content;
}

###########################################################################################
## POSITIVE RESULTS  ######################################################################
sub sho_ckeck_total {
  my($total, $act, $tit, $credit)=@_;
  if ($total > 0) {
    if ($act) {
      print $c[4]."[!] Listing ($total) of found results! ... \n";
      print $c[3]."[!] Getting data ...\n";
	}else{
	  if ($limit ne 500) {
	    print $c[4]."[!] Listing ($limit) of found results defined by user! ...\n";
	  }else{
        print $c[4]."[!] Listing ($total) of found results! \n";
	  }
	  if ($credit) { credit(); }
	}
  }else{
    no_Result($tit);
  }
}

###########################################################################################
## CREDITS      ###########################################################################
sub credit {
  print $c[4]."[!] Accessing to more results by --page <number> require credit!\n";
  sleep 2;
}
###########################################################################################
## BUILD ARRAYS  ##########################################################################
sub build_sho_ip {
  my $shoipall=$_[0];
  my @shoipall;
  if (($shoipall=~/$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
    my $startIP=$1.".".$2.".".$3.".".$4;
    my $endIP=$5.".".$6.".".$7.".".$8;
    my (@ip,@newIP,$i,$newIP,$j,$k,$l);
    @ip=split(/\./,$startIP);
    for($i=$ip[0];$i<=$5;$i++) { 
	  $ip[0]=0 if($i == $5);
      for($j=$ip[1];$j<=$6;$j++) { 
        $ip[1]=0 if($j == $6);
        for($k=$ip[2];$k<=$7;$k++) { 
          $ip[2]=0 if($k == $7);
          for($l=$ip[3];$l<=$8;$l++) { 
            $ip[3]=0 if($l == $8);
            $newIP=join('.',$i,$j,$k,$l);
            push @shoipall, $newIP;
          }
	    }
      }
	}
  }else{ 
    @shoipall=buildArraysLists($shoipall);
  }
  return @shoipall;
}

###########################################################################################
## JSON DECODE       ######################################################################
sub _json {
  my $shoRes =$_[0];
  my $json = JSON->new->allow_nonref;
  return $json->decode( $shoRes );
}

###########################################################################################
## PRINT  ##################################################################################
sub sho_print {
  my ($head, $key, $value, $sub)=@_;
  if ($sub) { 
    print $c[4]."\n[!]$c[10] $sub ...\n\n"; 
	if (defined $output) { printFile($output, "[+][+] $sub"); }
  }elsif ($head) { 
    print $c[10]."[+] $head: \n";
	if (defined $output) { printFile($output, "   [+] $head:"); }
  }elsif (!$key) {
    print $c[10]."    +$c[3] $value \n";
	if (defined $output) { printFile($output, "     -$value"); }
  }else{
    print $c[10]."[+] $key:$c[3] $value \n";
    if (defined $output) { printFile($output, "   [+] $key: $value"); }
  }
}

###########################################################################################
## END PRINT      #########################################################################
sub end_hash_print {
  my ($shoRes)=$_[0];
  my %shoRes = %$shoRes;	
  for my $f(keys %{$shoRes}) { 
	if ($shoRes->{$f}) {
	  my $fi=$shoRes{$f};
	  $f=~s/_/ /g;
      $f=ucfirst($f);
	  sho_print("", $f, $fi, "");
	}
  }
}

###########################################################################################
## SEARCH BY STRINGS ######################################################################
sub end_array_print {
  my ($tit, @arrays)=@_;
  if ($arrays[0]) {
	sho_print($tit, "", "", "");
    foreach my $array(@arrays) { sho_print("", "", $array, ""); }
  }
}

###########################################################################################
## COUNT RESULTS     ######################################################################
sub get_n {
  my $n=$_[0];
  $n++;
  ltak();
  print $c[1]; 
  timer();
  return $n;
}

###########################################################################################
## EXTERN COMMANDS   ######################################################################
sub sho_command {
  my ($ats, $command)=@_;
  stak();
  $ats=~s/://; 
  checkExternComnd($ats, $command);
}

###########################################################################################
## QUERY TAGS     #########################################################################
sub sho_query_tags {
  sho_print("", "", "", "Searching in shodan query tags");
  if ($pages eq 1) {advisePages();}
  sleep 1;
  
  my @founds;
  for(my $npages=1;$npages<=$pages;$npages+=1) {
    my $shoRes=getShoResults("$base/shodan/query/tags?key=$shoapikey");
    if ($shoRes) {
      $shoRes=_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "1", "query tags", "");
  my $n=0;
  foreach my $found (@founds) {
    $n=get_n($n);
    print " [$n/$total] QUERY TAG\n";
	sleep 1;
    my $value=$found->{"value"};
    my $count=$found->{"count"};
    if ( $value ) { sho_print("", "Value", $value, ""); }
    if ( $count ) { sho_print("", "Count", $count, ""); }
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
## LIST QUERIES   #########################################################################
sub sho_query {
  sho_print("", "", "", "Listening the saved search queries");
  if ($pages eq 1) { advisePages(); }
  my @founds;
  for(my $npages=1;$npages<=$pages;$npages+=1) {
    my $shoRes=getShoResults("$base/shodan/query?key=$shoapikey&pages=$npages");
    if ($shoRes) {
      $shoRes=_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "", "saved search queries", "");
  my $n=0;
  foreach my $found (@founds) {
    $n=get_n($n);
    print " SEARCH QUERY [$n/$total]\n";
	sleep 1;
	
	my $in1=-1;
	my @elements3=("Title", "Descrition", "Votes", "Time", "Query");
	my @elements23=("title", "description", "votes", "timestamp", "query");
	for my $element23(@elements23) {
	  $in1++;
	  my $key=$found->{$element23};
      if ($key) { print $c[10]."[+] $elements3[$in1]:$c[3] $key \n"; }
	}
    my $tag=$found->{"tags"};
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  end_array_print("Tags", @tags);
	}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
## TOKENS         #########################################################################
sub sho_tokens {
  my @shotokens=@_;
  sho_print("", "", "", "Determining used filters and parameters for given string");
  my $shoRes=getShoResults("$base/shodan/host/search/tokens?key=$shoapikey&query=$shotokens");
  sleep 1;
  if ( $shoRes ) {
    my @shoRes=split(",", $shoRes);
	my ($i, $n)=1;
	$n=get_n($n);
	# ltak();
	# print $c[1];
    # timer(); 
	print " STRING [$i/".scalar @shotokens."] ($shotokens)\n";
	for my $f(@shoRes) {
	  $i++;	  
      if ( $f =~ /\"string\":\s\"(.*)\"/ ) {
	    sho_print("", "String", $1, "") if $1;
      }
      if ( $f =~ /\"attributes\":\s\{(.*)\}/g ) {
	    sho_print("", "Attributes", $1, "") if $1;
      }
      if ( $f =~ /\"errors\":\s\[(.*)\]/g ) {
	    sho_print("", "Errors", $1, "") if $1;
      }
      if ( $f =~ /\"filters\":\s\[\"(.*)\"\]/g ) {
	    sho_print("", "Filters", $1, "") if $1;
      }
	}
  }else{
    print $c[2]."[!] ";
    no_Result($shotokens);
  }
  ltak(); 
}

###########################################################################################
## LIST SERVICES  #########################################################################
sub sho_services {
  sho_print("", "", "", "Listening all services that Shodan crawls");
  my $shoRes=getShoResults("$base/shodan/services?key=$shoapikey");
  sleep 1;
  if ( $shoRes ) {
    my $n=0;
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
      $n++;
	  sleep 1;
	  sho_print("", "Port", $1, "");
	  sho_print("", "Name", $2, "");
	  print $c[10]."..........................................\n";
      if ( $n == $limit ) { last; }
    }
  }else{
    print $c[2]."[!] ";
    no_Result("shodan setrvices");
  }
  ltak(); 
}

###########################################################################################
## MY IP ADDRESS  #########################################################################
sub shomyip {
  sho_print("", "", "", "Getting your IP address");
  sleep 1;
  my ($shoRes, $i)=getShoResults("$base/tools/myip?key=$shoapikey");
  if ( $shoRes =~ /"(.*)"/ ) {
	sho_print("", "IP", $1, "");
  }else{
    no_Result("your IP");
  }
  ltak(); 
}

###########################################################################################
## API INFO       #########################################################################
sub shoapinfo {
  sho_print("", "", "", "Getting your API info");
  sleep 1;
  my $shoRes=getShoResults("$base/api-info?key=$shoapikey");
  if ($shoRes) {
    $shoRes=_json($shoRes);
    end_hash_print($shoRes);
  }else{
    no_Result("your API Info");
  }
  ltak();
}

###########################################################################################
## DNS RESOLVE    #########################################################################
sub sho_dns_resolve {
  my ($hostnames, $nn)=@_;
  sho_print("", "", "", "DNS resolve Lookup for [$hostnames]");
  sleep 1;
  my $shoRes=getShoResults("$base/dns/resolve?hostnames=$hostnames&key=$shoapikey");
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
	  sleep 1;
	  sho_print("", "Hostname", $1, "");
	  sho_print("", "IP", $2, "");
    }
  }else{
    no_Result($hostnames);
  }
  ltak(); 
}

###########################################################################################
## DNS REVERSE    #########################################################################
sub sho_dns_reverse {
  my ($ip, $nn)=@_;
  sho_print("", "", "", "DNS reverse Lookup for [$ip]");
  sleep 1;
  my $shoRes=getShoResults("$base/dns/reverse?ips=$ip&key=$shoapikey");
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": \["(.*?)"\]/migs ) {
	  sleep 1;
	  sho_print("", "IP", $1, "");
	  sho_print("", "Hostname", $2, "");
    }
  }else{
    no_Result($ip);
  }
  ltak();
}

###########################################################################################
## SHODAN PORTS   #########################################################################
sub sho_ports {
  my ($port, $nn)=@_;
  sho_print("", "", "", "Getting all used shodan api Ports");
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/ports?key=$shoapikey");
  if ( $shoRes ) {
	my $i=()=$shoRes=~/\Q,/g;
	sho_print("", "Total ports", $i+1, "");
	sleep 1;
    $shoRes=~s/(\]|\[)//g;
    sho_print("", "Ports", $shoRes, "");	
  }else{
    no_Result("ports");
  }
  ltak();
}

###########################################################################################
## SHODAN PROTOCOLS   #####################################################################
sub sho_protos {
  my ($porotols, $nn)=@_;
  sho_print("", "", "", "Listing protocols that can be used when performing on-demand Internet");
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/protocols?key=$shoapikey");
  if ( $shoRes ) {
    $shoRes=_json($shoRes);
    end_hash_print($shoRes);
  }else{
    no_Result("protocols");
  }
  ltak();
}

###########################################################################################
## SEARCH COUNT   #########################################################################
sub sho_count {
  my ($query, $nn) =@_;
  if ($nn eq 1) { shosearchadvise(); }
  sho_print("", "", "", "Shodan api Search Count for [$query]");
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/host/count?key=$shoapikey&query=$query&facets=$facets");  
  if ($shoRes) {
    $shoRes=_json($shoRes);
    my $i=$shoRes->{'total'};
	if ($i) {
	  sho_print("", "Total", $i, "");
    }else{
      no_Result($query);
	}
  }
  ltak();
}

###########################################################################################
##  QUERY SEARCH  #########################################################################
sub sho_query_search {
  my ($query, $nn)=@_;
  sho_print("", "", "", "Searching [$query] in saved search queries");
  shosearchadvise();
  if ($pages eq 1) { advisePages(); }
  if ($nn eq 1) { shosearchadvise(); }
  sleep 1;
  
  my @founds;
  for(my $npages=1;$npages<=$pages;$npages+=1) {
    my $shoRes=getShoResults("$base/shodan/query/search?key=$shoapikey&query=$query&pages=$npages");
    if ($shoRes) {
      $shoRes=_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "1", $query, "");
  my $n=0;
  foreach my $found (@founds) {
   $n=get_n($n);
    print $c[1]." QUERY SEARCH [$n/$total]\n";
	sleep 1;

	my $in3=-1;
	my @elements3=("Title", "Descrition", "Votes", "Time", "Query");
	my @elements23=("title", "description", "votes", "timestamp", "query");
	for my $element23(@elements23) {
	  $in3++;
	  my $key=$found->{$element23};
      if ($key) { print $c[10]."[+] $elements3[$in3]:$c[3] $key \n"; }
	}
	
    my $tag=$found->{"tags"};
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  end_array_print("Tags", @tags);
	}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
## SEARCH BY STRINGS ######################################################################
sub sho_search {
  my ($target, $nn)=@_;  
  sho_print("", "", "", "Searching [$target] in Shodan api search");
  if ($nn eq 1) { shosearchadvise(); adviseLimit(); }
  for(my $npages=1;$npages<=$pages;$npages+=1) {
    my $shoRes=getShoResults("$base/shodan/host/search?key=$shoapikey&query=$target&facets=$facets&page=$npages");
    sleep 1;
    if ($shoRes) {
      $shoRes=_json($shoRes);
      my $i=$shoRes->{'total'};
      print $c[3]."[+] Total: $i Results found\n" if $i;
	  sleep 1;
	
	  my $in3=-1;
	  my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	  my @elements23=("ip", "country_name", "region_name", "postal_code", "org");
	  for my $element23(@elements23) {
	    $in3++;
	    my $key=$shoRes->{$element23};
        if ($key) { print $c[10]."[+] $elements3[$in3]:$c[3] $key \n"; }
	  }
      my $hostnam =$shoRes->{'hostnames'};
	  if ($hostnam) {
        my @hostnam=@{ $shoRes->{'hostnames'} };
	    end_array_print("Hostnames", @hostnam);
	  }
      my $n=0;
      my @founds=@{ $shoRes->{'matches'} };
      my $total=scalar @founds;
	  sho_ckeck_total($total, "", $target, "1");
      foreach my $found (@founds) {
	    my $ats="";
	   $n=get_n($n);
	    print " RESULT [$n/$i]\n\n";
	    sleep 1;
	  
	    my $in=-1;
	    my @elements=("IP", "Port", "Product", "Version", "Cps", "Time", "Last update", "Os", "Isp", "Asn", "Hash", "Sitemap hash", "Transport");
	    my @elements2=("ip_str", "port", "product", "version", "cps", "timestamp", "last_update", "os", "isp", "asn", "hash", "sitemap_hash", "transport");
		for my $element2(@elements2) {
	      $in++;
	      my $key=$found->{$element2};
		  if ($key) { 
		    sho_print("", $elements[$in], $key, "");
			if ($in < 2) { $ats.=":$key"; }
		  }
	    }		
	    my $cpe=$found->{"cpe"};
	    my $data=$found->{"data"};
	    my $banner=$found->{"banner"};
	    my $hostnam2=$found->{"hostnames"};
	    my $domains=$found->{"domains"};	  
        my $country=$found->{"location"}{"country_name"};
	    my $location=$found->{"location"};
        if ( $country ) { print $c[10]."[+] Country:$c[3] $country\n"; }
	    if ($hostnam2) {
          my @hostnames2=@{ $found->{'hostnames'} };
	      end_array_print("Hostnames", @hostnames2);
	    }
	    if ($domains) { 
	      my @domains=@{ $found->{'domains'} };
	      end_array_print("Domains", @domains);
	    }
	    if ($location) {
	      my $location=$found->{"location"};
	      end_hash_print($location);
	    }
	    if ( $cpe ) {
          my @founds5=@{ $found->{'cpe'} };
	      end_array_print("CPE", @founds5);
	    }
        if ( $data ) { sho_print("", "Data", $data, ""); }	  
        if ( $banner ) { sho_print("", "Banner", $banner, ""); }
        if ( defined $command ) {  sho_command($ats); }	  
        if ( $n == $limit ) { last; }
	  }
      ltak();
    }
  }
}

###########################################################################################
## SEARCH BY IP OR HOST  ##################################################################
sub sho_ip {
  my ($target, $nn)=@_; 
  sho_print("", "", "", "Getting [$target] Information");
  my $shoRes=getShoResults("$base/shodan/host/$target?key=$shoapikey");
  if ($shoRes) {
    $shoRes=_json($shoRes);
	my $in3=-1;
	my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	my @elements23=("ip_str", "country_name", "region_name", "postal_code", "org");
	for my $element23(@elements23) {
	  $in3++;
	  my $key=$shoRes->{$element23};
      if ($key) { sho_print("", $elements3[$in3], $key, ""); }
	}
    my $hostnam =$shoRes->{'hostnames'};
	if ($hostnam) {
	  my @hostnam=@{ $shoRes->{'hostnames'} };
	  end_array_print("Hostnames", @hostnam);
	}
	print "$c[1]......................................\n";
    print $c[4]."[!] Getting Data ...\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'data'} };
    my $total=scalar @founds;
	sho_ckeck_total($total, "", $target, "");
    foreach my $found (@founds) {
      my $ats="";
      $n++;
	  sleep 1;
	  print "$c[1]......................................\n";
	  
	  my $in=-1;
	  my @elements=("IP", "Port", "Product", "Version", "Cps", "Time", "Last update", "Os", "Isp", "Asn", "Hash", "Sitemap hash", "Transport");
	  my @elements2=("ip_str", "port", "product", "version", "cps", "timestamp", "last_update", "os", "isp", "asn", "hash", "sitemap_hash", "transport");
	  for my $element2(@elements2) {
	    $in++;
	    my $key=$found->{$element2};
		if ($key) { 
		  sho_print("", $elements[$in], $key, "");
		  if ($in < 2) { $ats.=":$key"; }
		}
	  }
	  my $cpe=$found->{"cpe"};
	  my $data=$found->{"data"};
	  my $banner=$found->{"banner"};
	  my $hostnam2=$found->{"hostnames"};
	  my $domains=$found->{"domains"};	  
      my $country=$found->{"location"}{"country_name"};
	  my $location=$found->{"location"};
      if ( $country ) { print $c[10]."[+] Country:$c[3] $country\n"; }
	  if ($hostnam2) {
        my @hostnames2=@{ $found->{'hostnames'} };
	    end_array_print("Hostnames", @hostnames2);
	  }
	  if ($domains) { 
	    my @domains=@{ $found->{'domains'} };
	    end_array_print("Domains", @domains);
	  }
	  if ($location) {
	    my $location=$found->{"location"};
	    end_hash_print($location);
	  }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
	    end_array_print("CPE", @founds5);
	  }
      if ( $data ) { sho_print("", "Data", $data, ""); }
      if ( $banner ) { sho_print("", "Banner", $banner, ""); }	
      if ( defined $command ) {  sho_command($ats); }	  
      if ( $n == $limit ) { last; }
    }
    ltak();
  }
}

###########################################################################################
###########################################################################################
## MAIN      ##############################################################################
my $s=0;
for (@sho_scans) { $s++ if defined $_; }
if ($s) {
  if (!defined $shofilters) {
    print $c[11];
    timer();
    print " ::: EXPLORING SHODAN SEARCH ENGINE :::\n";
    testConnection();
	######################################
    if ( $shoip ) {
      my @shoip=build_sho_ip($shoip);
      for my $f(@shoip) { $nn++; check_host_validation($f, $nn, "1"); }
    }else{
      if ( $shocount ) {
        my @shocount=buildArraysLists($shocount);
	    for my $f(@shocount) { $nn++; sho_count($f, $nn); } }
      if ( $shosearch ) { 
        my @shosearch=buildArraysLists($shosearch);
	    for my $f(@shosearch) { $nn++; sho_search($f, $nn); }
      }
      if ( $shoquerySearch ) { 
        my @shoquerySearch=buildArraysLists($shoquerySearch);
	    for my $f(@shoquerySearch) { $nn++; sho_query_search($f, $nn); }
      }
      if ( $shoresolve ) { 
        my @shoresolve=build_sho_ip($shoresolve);
        for my $f(@shoresolve) { $nn++; check_host_validation($f, $nn, "2"); }
      }
      if ( $shoreverse ) { 
        my @shoreverse=build_sho_ip($shoreverse);
        for my $f(@shoreverse) { $nn++; check_host_validation($f, $nn, "3"); }
      }
      if ( $shotokens ) { 
        my @shotokens=build_sho_ip($shotokens);
        for my $f(@shotokens) { sho_tokens(@shotokens); }
      }
      if ( $shoports ) { sho_ports(); }
      if ( $shoprotos ) { sho_protos(); }
      if ( $shoqueryTags ) { sho_query_tags(); }
      if ( $shoquery ) { sho_query(); }
      if ( $shoservices ) { sho_services(); }
      if ( $shomyip ) { shomyip(); }
      if ( $shoapiInfo ) { shoapinfo(); }
      if ( $shofilters ) { shodan_help(); }
	  ######################################
      print $c[3]."[!] Results saved in [$output]\n" if defined $output;
    }
  }
}else{ 
  sho_menu(); 
}

###########################################################################################
## END MAIN     ###########################################################################
###########################################################################################

1;

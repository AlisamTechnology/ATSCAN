#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## SHODAN

our($ua, $limit, $shoapikey, $shoip, $shocount, $shosearch, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, 
    $shoreverse, $shomyip, $shoapiInfo, $shofilters, $facets, $pages, $output, $V_IP, $V_RANG, @c);
		
my $nn=0;
my $noshodanres="No results found|Invalid IP";
my $base="https://api.shodan.io";

$facets="" if !$facets;
$pages=1 if !$pages;
###########################################################################################
## INTRO     ##############################################################################
if (!defined $shofilters) {
  print $c[11];
  timer();
  print " ::: EXPLORING SHODAN SEARCH ENGINE :::\n";
}

testConnection();
checkCpanModules();	
use JSON;	

###########################################################################################
## GET HOST IP  ###########################################################################
sub getshodanip {
  my $f=$_[0];
  my $ff;
  my $getf=checkExtraInfo($f);
  if ($getf) { 
    $ff=inet_ntoa($getf); 
  }
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
  print $c[4]."[!] Use --limit to set number of results! ex: --limit 10\n";
}

###########################################################################################
## RESULTS PAGES  #########################################################################
sub advisePages {
  print $c[4]."[!] Use --pages <number pages> to get more page results! ex: --pages 2 \n";
}

###########################################################################################
## GET RESULTS  ###########################################################################
sub getShoResults {
  my $u=$_[0];
  return $ua->get($u)->content;
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
## PRINT  ##################################################################################
sub sho_print {
  my ($head, $key, $value, $sub)=@_;
  if ($sub) { 
    print $c[4]."\n[!]$c[10] $sub ...\n"; 
	if (defined $output) { printFile($output, "[+][+] $sub"); }
  }elsif ($head) { 
    print $c[10]."[+] $head: ";
	if (defined $output) { printFile($output, "   [+] $head:"); }
  }elsif (!$key) {
    print $c[3]."$value ";
	if (defined $output) { printFile($output, "     -$value"); }
  }else{
    print $c[10]."[+] $key:$c[3] $value \n";
    if (defined $output) { printFile($output, "   [+] $key: $value"); }
  }
}

###########################################################################################
## MENU  ##################################################################################
if ( $shoip ) {
  my @shoip=build_sho_ip($shoip);
  for my $f(@shoip) { 
    $nn++;
	check_host_validation($f, $nn, "1");
  }
}else{
  if ( $shocount ) {
    my @shocount=buildArraysLists($shocount);
	for my $f(@shocount) { $nn++; sho_count($f, $nn); }
  }
  if ( $shosearch ) { 
    my @shosearch=buildArraysLists($shosearch);
	for my $f(@shosearch) { $nn++; sho_search($f, $nn); }
  }
  if ( $shoquerySearch ) { 
    my @shoquerySearch=buildArraysLists($shoquerySearch);
	for my $f(@shoquerySearch) { sho_query_search($f, $nn); }
  }
  if ( $shoresolve ) { 
    my @shoresolve=build_sho_ip($shoresolve);
    for my $f(@shoresolve) { 
      $nn++;
	  check_host_validation($f, $nn, "2");
    }
  }
  if ( $shoreverse ) { 
    my @shoreverse=build_sho_ip($shoreverse);
    for my $f(@shoreverse) { 
      $nn++;
	  check_host_validation($f, $nn, "3");
    }
  }
  if ( $shoqueryTags ) { sho_query_tags(); }
  if ( $shoquery ) { sho_query(); }
  if ( $shoservices ) { sho_services(); }
  if ( $shomyip ) { shomyip(); }
  if ( $shoapiInfo ) { shoapinfo(); }
  if ( $shofilters ) { shodan_help(); }
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
      $shoRes=JSON->new->decode($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  if ($total > 0) {
    print $c[3]."[!] Total results found: $total\n";
  }else{
    no_Result("quey tags");
  }
  my $n=0;
  foreach my $found (@founds) {
    $n++;
	ltak();
	timer();
    print $c[1]." QUERY TAG [$n/$total]\n";
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
      $shoRes=JSON->new->decode($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  if ($total > 0) {
    print $c[3]."[!] Total results found: $total\n\n";
  }else{
    no_Result("saved search queries");
  }
  my $n=0;
  foreach my $found (@founds) {
    $n++;
	ltak();
	timer();
    print $c[1]." SEARCH QUERY [$n/$total]\n";
	sleep 1;
    my $votes=$found->{"votes"};
    my $description=$found->{"description"};
    my $title=$found->{"title"};
    my $timestamp=$found->{"timestamp"};
    my $query=$found->{"query"};
    my $tag=$found->{"tags"};

    if ( $title ) { sho_print("", "Title", $title, ""); }
    if ( $votes ) { sho_print("", "Votes", $votes, ""); }
    if ( $description ) { sho_print("", "Description", $description, ""); }
    if ( $timestamp ) { sho_print("", "Time", $timestamp, ""); }
    if ( $query ) { sho_print("", "Query", $query, ""); }
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  if ($tags[0]) {
	    sho_print("Tags", "", "", "");
        foreach my $tags (@tags) { sho_print("", "", $tags, ""); }
        print "\n";
	  }
	}
	print "\n";
    if ( $n == $limit ) { last; }
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
    $shoRes=JSON->new->decode($shoRes);
	sho_print("", "HTTPS", $shoRes->{"https"}, "");
	sho_print("", "Unlocked", $$shoRes->{"unlocked"}, "");
	sho_print("", "Unlocked left", $$shoRes->{"unlocked_left"}, "");
	sho_print("", "Telnet", $$shoRes->{"telnet"}, "");
	sho_print("", "Scan credits", $$shoRes->{"https"}, "");
	sho_print("", "Plan", $$shoRes->{"plan"}, "");
	sho_print("", "Scan credits", $$shoRes->{"scan_credits"}, "");
	sho_print("", "Query credits", $$shoRes->{"query_credits"}, "");
	ltak();
  }else{
    no_Result("your API Info");
  }
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
## SEARCH COUNT   #########################################################################
sub sho_count {
  my ($query, $nn) =@_;
  if ($nn eq 1) { shosearchadvise(); }
  sho_print("", "", "", "Shodan api Search Count for [$query]");
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/host/count?key=$shoapikey&query=$query&facets=$facets");  
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
	if ($i) {
	  sho_print("", "Total", $i, "");
    }else{
      no_Result($query);
	}
  }
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
      $shoRes=JSON->new->decode($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  if ($total > 0) {
    print $c[3]."[!] Total results found: $total\n";
  }else{
    no_Result($query);
  }
  my $n=0;
  foreach my $found (@founds) {
    $n++;
	print "\n";
	ltak();
	timer();
    print $c[1]." QUERY SEARCH [$n/$total]\n";
	sleep 1;
    my $votes=$found->{"votes"};
    my $description=$found->{"description"};
    my $title=$found->{"title"};
    my $timestamp=$found->{"timestamp"};
    my $query=$found->{"query"};
    my $tag=$found->{"tags"};

    if ( $votes ) { sho_print("", "Votes", $votes, ""); }
    if ( $description ) { sho_print("", "Description", $description, ""); }
    if ( $title ) { sho_print("", "Title", $title, ""); }
    if ( $timestamp ) { sho_print("", "Time", $timestamp, ""); }
    if ( $query ) { sho_print("", "Query", $query, ""); }
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  if ($tags[0]) {
	    sho_print("Tags", "", "", "");
        foreach my $tags (@tags) { sho_print("", "", $tags, ""); }
        print "\n";
	  }
	}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
## SEARCH BY STRINGS ######################################################################
sub sho_search {
  my ($target, $nn)=@_;
  if ($nn eq 1) {
    shosearchadvise();
    adviseLimit();
  }
  sho_print("", "", "", "Searching [$target] in Shodan api");
  my $shoRes=getShoResults("$base/shodan/host/search?key=$shoapikey&query=$target&facets=$facets");
  sleep 1;
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
    print $c[3]."[+] Total: $i Results found\n" if $i;
	sleep 1;
	
	my $in3=-1;
	my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	my @elements23=("ip", "country_name", "region_name", "postal_code", "org");
	for my $element23(@elements23) {
	  $in3++;
	  my $key=$shoRes->{$element23};
      if ($key) {
		print $c[10]."[+] $elements3[$in3]:$c[3] $key \n";
	  }
	}
    my $hostnam =$shoRes->{'hostnames'};
	if ($hostnam) {
      my @hostnames=@{ $shoRes->{'hostnames'} };
	  if (scalar @hostnames > 0) {
	    sho_print("Hostnames", "", "", "");
        foreach my $host(@hostnames) { sho_print("", "", $host, ""); }
        print "\n";
	  }
	}

    my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
    my $t=scalar @founds;
    if ($t > 0) {
      print $c[3]."[!] Getting Data...\n";
    }else{
      no_Result($target);
    }
    foreach my $found (@founds) {
      $n++;
	  print "\n";
      ltak();
	  print $c[1];
	  timer();
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
		}
	  }
	  my $cpe=$found->{"cpe"};
	  my $data=$found->{"data"};
	  my $banner=$found->{"banner"};
	  my $hostnam2=$found->{"hostnames"};
      my $country=$found->{"location"}{"country_name"};
      if ( $country ) { print $c[10]."[+] Country:$c[3] $country\n"; }
	  if ($hostnam2) {
        my @hostnames2=@{ $found->{'hostnames'} };
	    if (scalar @hostnames2 > 0) {
	      sho_print("Hostnames", "", "", "");
          foreach my $host2(@hostnames2) { sho_print("", "", $host2, ""); }
          print "\n";
		}
	  }
	  my $location=$found->{"location"};
	  if ($location) {
        for my $f(keys %{$location}) { 
		  if ($location->{$f}) {
		    my $if=$location->{$f};
		    $f=~s/_/ /g;
			$f=ucfirst($f);
		    sho_print("", $f, $if, "");
		  }
	    }
	  }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
		if ($founds5[0]) { 
		  sho_print("CPE", "", "", ""); 
          foreach my $f(@founds5) { sho_print("", "", $f, ""); }
		  print "\n"; 
		}
	  }
      if ( $data ) { sho_print("", "Data", $data, ""); }
      if ( $banner ) { sho_print("", "Banner", $banner, ""); }	  
      if ( $n == $limit ) { last; }
	}
    ltak();
  }
}

###########################################################################################
## SEARCH BY IP OR HOST  ##################################################################
sub sho_ip {
  my ($target, $nn)=@_; 
  sho_print("", "", "", "Getting [$target] Information");
  my $shoRes=getShoResults("$base/shodan/host/$target?key=$shoapikey");
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);	
	my $in3=-1;
	my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	my @elements23=("ip_str", "country_name", "region_name", "postal_code", "org");
	for my $element23(@elements23) {
	  $in3++;
	  my $key=$shoRes->{$element23};
      if ($key) {
		sho_print("", $elements3[$in3], $key, "");
	  }
	}
    my $hostnam =$shoRes->{'hostnames'};
	if ($hostnam) {
      my @hostnames=@{ $shoRes->{'hostnames'} };
	  if (scalar @hostnames > 0) {
	    sho_print("Hostnames", "", "", "");
        foreach my $host(@hostnames) { sho_print("", "", $host, ""); }
        print "\n";
      }
	}
    print $c[4]."\n[!] Getting Data ...\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'data'} };
	
    my $t=scalar @founds;
    if ($t > 0) {
      print $c[3]."[!] Getting Data...\n";
    }else{
      no_Result($target);
    }
	
    foreach my $found (@founds) {
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
		}
	  }
	  my $cpe=$found->{"cpe"};
	  my $data=$found->{"data"};
	  my $banner=$found->{"banner"};
	  my $hostnam2=$found->{"hostnames"};
      my $country=$found->{"location"}{"country_name"};
      if ( $country ) { print $c[10]."[+] Country:$c[3] $country\n"; }
	  if ($hostnam2) {
        my @hostnames2=@{ $found->{'hostnames'} };
		if (scalar @hostnames2) {
		  sho_print("Hostnames", "", "", "");
          foreach my $host2 (@hostnames2) { sho_print("", "", $host2, ""); }
		  print "\n";
	    }
	  }
	  my $location=$found->{"location"};
	  if ($location) {
        for my $f(keys %{$location}) { 
		  if ($location->{$f}) {
		    my $if=$location->{$f};
		    $f=~s/_/ /g;
			$f=ucfirst($f);
			sho_print("", $f, $if, "");
		  }
	    }
	  }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
		if ($founds5[0]) { 
		  sho_print("CPE", "", "", ""); 
          foreach my $f(@founds5) { sho_print("", "", $f, ""); }
		  print "\n"; 
		}
	  }
      if ( $data ) { sho_print("", "Data", $data, ""); }
      if ( $banner ) { sho_print("", "Banner", $banner, ""); }	  
      if ( $n == $limit ) { last; }
    }
    ltak();
  }
}
###########################################################################################
## END SCANS    ###########################################################################
###########################################################################################

1;

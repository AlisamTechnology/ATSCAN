#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## SHODAN

our($ua, $limit, $shoapikey, $shoip, $shocount, $shosearch, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, 
    $shoreverse, $shomyip, $shoapiInfo, $facets, $pages, $V_IP, $V_RANG, @c);
		
my $nn=0;
$facets="" if !$facets;
$pages=1 if !$pages;

testConnection();
checkCpanModules();	
use JSON;	
my $base="https://api.shodan.io";

print $c[11];
timer();
print " ::: EXPLORING SHODAN SEARCH ENGINE :::\n";
sleep 2;

###########################################################################################
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
if ( $shoip ) {
  my @shoip=build_sho_ip($shoip);
  for my $f(@shoip) { 
    $nn++;
    if ( $f =~ /^$V_IP$/ ) {
      sho_ip($f, $nn);
    }else{
	  $f=getshodanip($f);
	  if ($f) { sho_ip($f, $nn); }
    }
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
	for my $f(@shoquerySearch) { sho_query_search($f); }
  }
  if ( $shoqueryTags ) { 
    my @shoqueryTags=buildArraysLists($shoqueryTags);
	for my $f(@shoqueryTags) { $nn++; sho_query_tags($f, $nn); }
  }
  if ( $shoresolve ) { 
    my @shoresolve=build_sho_ip($shoresolve);
    for my $f(@shoresolve) { 
      $nn++;
      if ( $f =~ /^$V_IP$/ ) {
        sho_dns_resolve($f, $nn);;
      }else{
	    $f=getshodanip($f);
	    if ($f) { sho_dns_resolve($f, $nn); }
      }
    }
  }
  if ( $shoreverse ) { 
    my @shoreverse=build_sho_ip($shoreverse);
    for my $f(@shoreverse) { 
      $nn++;
      if ( $f =~ /^$V_IP$/ ) {
        sho_dns_reverse($f, $nn);;
      }else{
	    $f=getshodanip($f);
	    if ($f) { sho_dns_reverse($f, $nn); }
      }
    }
  }
  if ( $shoquery ) { sho_query(); }
  if ( $shoservices ) { sho_services(); }
  if ( $shomyip ) { shomyip(); }
  if ( $shoapiInfo ) { shoapinfo(); }
}

###########################################################################################
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
sub sho_query_tags {
  print $c[4]."[!] Searching in shodan query tags...\n";
  if ($pages eq 1) {advisePages();}
  sleep 2;
  
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
    noResult(); last;
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
    if ( $value ) { print $c[10]."[+] Value:$c[3] $value \n"; }
    if ( $count ) { print $c[10]."[+] Count:$c[3] $count \n";}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
sub sho_query_search {
  my ($query, $nn)=@_;
  print $c[4]."[!] Searching [$query] in saved search queries ...\n";
  if ($pages eq 1) {advisePages();}
  sleep 2;
  
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
    noResult(); last;
  }
  my $n=0;
  foreach my $found (@founds) {
    $n++;
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

    if ( $votes ) { print $c[10]."[+] Votes:$c[3] $votes\n"; }
    if ( $description ) { print $c[10]."[+] Description:$c[3] $description\n"; }
    if ( $title ) { print $c[10]."[+] Title:$c[3] $title \n"; }
    if ( $timestamp ) { print $c[10]."[+] Time:$c[3] $timestamp \n"; }
    if ( $query ) { print $c[10]."[+] Query:$c[3] $query \n"; }
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
      print $c[10]."[+] Tags: " if $tags[0];
      foreach my $tags (@tags) { print "$c[3] $tags"; }
      print "\n";
	}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

###########################################################################################
sub sho_query {
  print $c[4]."[!] Listening the saved search queries ...\n";
  if ($pages eq 1) {advisePages();}
  sleep 2;
  
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
    print $c[3]."[!] Total results found: $total\n";
  }else{
    noResult(); last;
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

    if ( $votes ) { print $c[10]."[+] Votes:$c[3] $votes\n"; }
    if ( $description ) { print $c[10]."[+] Description:$c[3] $description\n"; }
    if ( $title ) { print $c[10]."[+] Title:$c[3] $title \n"; }
    if ( $timestamp ) { print $c[10]."[+] Time:$c[3] $timestamp \n"; }
    if ( $query ) { print $c[10]."[+] Query:$c[3] $query \n"; }
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
      print $c[10]."[+] Tags: " if $tags[0];
      foreach my $tags (@tags) { print "$c[3] $tags"; }
      print "\n";
	}
    if ( $n == $limit ) { last; }
  }
  ltak(); 
}

############## #############################################################################
sub sho_services {
  print $c[4]."[!] Listening all services that Shodan crawls ...\n\n";
  my $shoRes=getShoResults("$base/shodan/services?key=$shoapikey");
  sleep 1;
  if ( $shoRes ) {
    my $n=0;
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
      $n++;
      print $c[10]."[+] Port: $c[3]$1 \n";
      print $c[10]."[+] Name: $c[3] $2 \n\n";
      if ( $n == $limit ) { last; }
    }
  }else{
    noResult();
  }
  ltak(); 
}

###########################################################################################
sub sho_dns_resolve {
  my ($hostnames, $nn)=@_;
  print $c[4]."[!] DNS resolve Lookup for [$hostnames] ...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/dns/resolve?hostnames=$hostnames&key=$shoapikey");
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
      print $c[10]."[+] Hostname:$c[3] $1 \n";
      print $c[10]."[+] IP:$c[3] $2 \n";
    }
  }else{
    noResult();
  }
  ltak(); 
}

###########################################################################################
sub sho_dns_reverse {
  my ($ips, $nn)=@_;
  print $c[4]."[!] DNS reverse Lookup for [$ips] ...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/dns/reverse?ips=$ips&key=$shoapikey");
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": \["(.*?)"\]/migs ) {
	  sleep 1;
      print $c[10]."[+] IP:$c[3] $1\n";
      print $c[10]."[+] Hostname:$c[3] $2\n";
    }
  }else{
    noResult();
  }
  ltak();
}

###########################################################################################
sub shomyip {
  print $c[4]."[!] Getting your IP ...\n\n";
  sleep 1;
  my ($shoRes, $i)=getShoResults("$base/tools/myip?key=$shoapikey");
	
  if ( $shoRes =~ /"(.*)"/ ) {
    print $c[10]."[+] IP:$c[3] $1\n";
  }else{
    noResult();
  }
  ltak(); 
}

###########################################################################################
sub shoapinfo {
  print $c[4]."[!] Getting your API Info ...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/api-info?key=$shoapikey");
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    print $c[10]."[+] HTTPS: $c[3]".$shoRes->{"https"}."\n"; 
    print $c[10]."[+] Unlocked: $c[3]".$shoRes->{"unlocked"}."\n"; 
    print $c[10]."[+] Unlocked left: $c[3]".$shoRes->{"unlocked_left"}."\n"; 
    print $c[10]."[+] Telnet: $c[3]".$shoRes->{"telnet"}."\n"; 
    print $c[10]."[+] Scan credits: $c[3]".$shoRes->{"scan_credits"}."\n";
    print $c[10]."[+] Plan: $c[3]".$shoRes->{"plan"}."\n"; 
    print $c[10]."[+] Query credits: $c[3]".$shoRes->{"query_credits"}."\n"; 
	ltak();
  }else{
    noResult();
  }
}

###########################################################################################
sub sho_count {
  my ($query, $nn) =@_;
  print $c[4]."[!] Shodan Search Count for [$query] ...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/host/count?key=$shoapikey&query=$query&facets=$facets");  
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
    print $c[10]."[+] Total:$c[3] $i\n";
	ltak();
  }else{
    noResult();
  }
}

###########################################################################################
sub sho_search {
  my ($target, $nn)=@_;
  print $c[4]."[!] Searching [$c[10]$target$c[4]\] in Shodan api...\n";
  adviseLimit();
  my $shoRes=getShoResults("$base/shodan/host/search?key=$shoapikey&query=$target&facets=$facets");
  sleep 1;
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
    print $c[3]."[+] Total:$i Results found\n";
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
        print $c[10]."[+] Hostnames:";
        foreach my $host(@hostnames) { 
	      print $c[10]."$c[3] $host ";
		}
      }
	  print "\n";
	}

    print $c[4]."[!] Getting Data ...\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
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
		  print $c[10]."[+] $elements[$in]:$c[3] $key \n";
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
        print $c[10]."[+] Hostnames:";
        foreach my $host2 (@hostnames2) { 
	      print "$c[3] $host2 "; 
	    }
		print "\n";
	  }
	  my $location=$found->{"location"};
	  if ($location) {
        for my $f(keys %{$location}) { 
		  if ($location->{$f}) {
		    my $if=$location->{$f};
		    $f=~s/_/ /g;
			$f=ucfirst($f);
			print $c[10]."[+] $f: $c[3]$if \n";
		  }
	    }
	  }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
        foreach my $f(@founds5) { print $c[10]."[+] Cpe:$c[3] $f \n"; }
	  }
      if ( $data ) { print $c[10]."[+] Data:\n$c[3]$data\n"; }
      if ( $banner ) { print $c[10]."[+] Banner:$c[3] $banner \n"; }	  
      if ( $n == $limit ) { last; }
	}
    ltak();
  }else{
    noResult();
  }
}

###########################################################################################
sub sho_ip {
  my ($target, $nn)=@_;  
  ltak();
  my $shoRes=getShoResults("$base/shodan/host/$target?key=$shoapikey"); 
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
	print $c[4]."[!] Getting [$c[10]$target$c[4]\] Information ...\n";
	sleep 1;
	
	my $in3=-1;
	my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	my @elements23=("ip_str", "country_name", "region_name", "postal_code", "org");
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
        print $c[10]."[+] Hostnames:";
        foreach my $host(@hostnames) { 
	      print $c[10]."$c[3] $host ";
		}
      }
	  print "\n";
	}
    print $c[4]."[!] Getting Data ...\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'data'} };
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
		  print $c[10]."[+] $elements[$in]:$c[3] $key \n";
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
        print $c[10]."[+] Hostnames:";
        foreach my $host2 (@hostnames2) { 
	      print "$c[3] $host2 "; 
	    }
		print "\n";
	  }
	  my $location=$found->{"location"};
	  if ($location) {
        for my $f(keys %{$location}) { 
		  if ($location->{$f}) {
		    my $if=$location->{$f};
		    $f=~s/_/ /g;
			$f=ucfirst($f);
			print $c[10]."[+] $f:$c[3] $if \n";
		  }
	    }
	  }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
        foreach my $f(@founds5) { print $c[10]."[+] Cpe:$c[3] $f \n"; }
	  }
      if ( $data ) { print $c[10]."[+] Data:\n$c[3]$data\n"; }
      if ( $banner ) { print $c[10]."[+] Banner:$c[3] $banner \n"; }	  
      if ( $n == $limit ) { last; }
    }
    ltak();
  }else{
    noResult();
  }
}

#############################################################################
sub adviseLimit {
  print $c[4]."[!] Max results is set to $c[10]($limit)$c[4]! Use --limit to set other value!\n";
}

#############################################################################
sub advisePages {
  print $c[4]."[!] Use --pages <number pages> to get more page results! ex: --pages 2 \n";
}

#############################################################################
## GET RESULTS
sub getShoResults {
  my $u=$_[0];
  return $ua->get($u)->content;
}

#############################################################################

1;

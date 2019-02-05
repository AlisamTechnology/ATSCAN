#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## SHODAN

our($ua, $limit, $shoapikey, $shoip, $shocount, $shosearch, $shoquery, $shoquerySearch, $shoqueryTags, $shoservices, $shoresolve, 
    $shoreverse, $shomyip, $shoapiInfo, $shoports, $shoprotos, $shofilters, $facets, $V_IP, $V_RANG, @c);
		
my $nn=0;
$facets="" if !$facets;

##
if ( $shofilters ) { shofilters(); }
else{
  testConnection();
  print $c[11];
  timer();
  print " ::: EXPLORING SHODAN SEARCH ENGINE :::\n";
}
checkCpanModules();	
use JSON;	
my $base="https://api.shodan.io";
sleep 1;

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
  if ( $shoports ) { shoports(); }
  if ( $shoprotos ) { shoprotos(); }
}
#############################################################################
sub shoports {
  print $c[4]."[!] Getting port numbers that the crawlers are looking for...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/ports?key=$shoapikey");
  if ($shoRes) {
	print $c[10]."[+] Ports:$c[3] $shoRes\n";
  }else{
    noResult();
  }
  ltak();
}

#############################################################################
sub shoprotos {
  print $c[4]."[!] Getting port numbers that the crawlers are looking for...\n\n";
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/protocols?key=$shoapikey");
  if ($shoRes) {
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
	  print $c[10]."[+] $1: $c[3]$2\n";
	}
  }else{
    noResult();
  }
  ltak();
}

#############################################################################
sub shofilters {
  print $c[11]."[!] SHODAN API SEARCH OPTIONS:\n\n";
  shosearchqueryhelp();
  printshohelp();
  shosearchfacetshelp();
  printshohelp();
  shoserachpagehelp();
  shosearchminifyhelp();
  ltak();
  exit();
}

###########################################################################################
sub build_sho_ip {
  my $shoipall=$_[0];
  my @shoipall;
  if (($shoipall=~/$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
    my $startIp=$1.".".$2.".".$3.".".$4;
    my $endIp=$5.".".$6.".".$7.".".$8;
    my (@ip,@newIp,$i,$newIp,$j,$k,$l);
    @ip=split(/\./,$startIp);
    for($i=$ip[0];$i<=$5;$i++) { 
	  $ip[0]=0 if($i == $5);
      for($j=$ip[1];$j<=$6;$j++) { 
        $ip[1]=0 if($j == $6);
        for($k=$ip[2];$k<=$7;$k++) { 
          $ip[2]=0 if($k == $7);
          for($l=$ip[3];$l<=$8;$l++) { 
            $ip[3]=0 if($l == $8);
            $newIp=join('.',$i,$j,$k,$l);
            push @shoipall, $newIp;
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
  adviseLimit();
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/query/tags?key=$shoapikey");
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    print $c[3]."[!] Total results found: ".$shoRes->{'total'}. "\n";
	ltak();
	sleep 1;
	my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
    foreach my $found (@founds) {
	  sleep 1;
      my $value=$found->{"value"};
      my $count=$found->{"count"};
      $n++;
      print "\n";
      if ( $value ) { print $c[10]."[+] Value :$c[3] $value \n"; }
      if ( $count ) { print $c[10]."[+] Count :$c[3] $count \n";}
      
      if ( $n == $limit ) { last; }
    }
  }else {
    noResult();
  }
  ltak(); 
}

###########################################################################################
sub sho_query_search {
  my ($query, $nn)=@_;
  print $c[4]."[!] Searching [$query] in saved search queries ...\n";
  adviseLimit();
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/query/search?key=$shoapikey&query=$query");
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    print $c[3]."[!] Total results found: ".$shoRes->{'total'}. "\n";
	ltak();
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
    foreach my $found (@founds) {
      $n++;
      ltak();
	  sleep 1;
      my $votes=$found->{"votes"};
      my $description=$found->{"description"};
      my $title=$found->{"title"};
      my $timestamp=$found->{"timestamp"};
      my $query=$found->{"query"};

      if ( $votes ) { print $c[10]."[+] Votes :$c[3] $votes\n"; }
      if ( $description ) { print $c[10]."[+] Description :$c[3] $description \n\n"; }
      if ( $title ) { print $c[10]."[+] Title :$c[3] $title \n"; }
      if ( $timestamp ) { print $c[10]."[+] Timestamp :$c[3] $timestamp \n"; }
      if ( $query ) { print $c[10]."[+] Query :$c[3] $query \n"; }
      print $c[10]."[+] Tags : \n";
      my @tags=@{ $found->{'tags'} };
      foreach my $tag (@tags) { print "$c[3]  $tag\n"; }
      if ( $n == $limit ) { last; }
    }
  }else{
     noResult();
  }
  ltak(); 
}

###########################################################################################
sub sho_query {
  print $c[4]."[!] Listening the saved search queries ...\n";
  adviseLimit();
  sleep 1;
  my $shoRes=getShoResults("$base/shodan/query?key=$shoapikey");
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    print $c[3]."[!] Total results found: ".$shoRes->{'total'}."\n\n";
	ltak();
    my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
    foreach my $found (@founds) {
      $n++;
      print "\n";
	  sleep 1;
      my $votes=$found->{"votes"};
      my $description=$found->{"description"};
      my $title=$found->{"title"};
      my $timestamp=$found->{"timestamp"};
      my $query=$found->{"query"};
      if ( $votes ) { print $c[10]."[+] Votes : $c[3]".$votes."\n"; }
      if ( $description ) { print $c[10]."[+] Description : $c[3]".$description."\n\n"; }
	  if ( $title ) { print $c[10]."[+] Title : $c[3]".$title."\n"; }
      if ( $timestamp ) { print $c[10]."[+] Timestamp : $c[3]".$timestamp."\n"; }
      if ( $query ) { print $c[10]."[+] Query : $c[3]".$query."\n"; }
      print $c[10]."[+] Tags : \n";
      my @tags=@{ $found->{'tags'} };
      foreach my $tag (@tags) { print "   $c[3] $tag\n"; }
      if ( $n == $limit ) { last; }
    }
  }else{
    noResult();
  }
  ltak(); 
}

###########################################################################################
sub sho_services {
  print $c[4]."[!] Listening all services that Shodan crawls ...\n\n";
  my $shoRes=getShoResults("$base/shodan/services?key=$shoapikey");
  sleep 1;
  if ( $shoRes ) {
    my $n=0;
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
      $n++;
      print $c[10]."[+] Port :$c[3]$1 \n";
      print $c[10]."[+] Name :$c[3] $2 \n\n";
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
      print $c[10]."[+] Hostname :$c[3] $1 \n";
      print $c[10]."[+] IP :$c[3] $2 \n";
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
      print $c[10]."[+] IP :$c[3] $1\n";
      print $c[10]."[+] Hostname :$c[3] $2\n";
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
    print $c[10]."[+] IP :$c[3] $1\n";
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
    print $c[10]."[+] HTTPS : $c[3]".$shoRes->{"https"}."\n"; 
    print $c[10]."[+] Unlocked : $c[3]".$shoRes->{"unlocked"}."\n"; 
    print $c[10]."[+] Unlocked left : $c[3]".$shoRes->{"unlocked_left"}."\n"; 
    print $c[10]."[+] Telnet : $c[3]".$shoRes->{"telnet"}."\n"; 
    print $c[10]."[+] Scan credits : $c[3]".$shoRes->{"scan_credits"}."\n";
    print $c[10]."[+] Plan : $c[3]".$shoRes->{"plan"}."\n"; 
    print $c[10]."[+] Query credits : $c[3]".$shoRes->{"query_credits"}."\n"; 
	ltak();
  }else{
    noResult();
  }
}

###########################################################################################
sub sho_count {
  my ($query, $nn) =@_;
  print $c[4]."[!] Shodan Search Count for [$query] ...\n";
  shosearchadvise();
  print "\n";
  my $shoRes=getShoResults("$base/shodan/host/count?key=$shoapikey&query=$query&facets=$facets");  
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
    print $c[10]."[+] Total :$c[3] $i\n";
	ltak();
  }else{
    noResult();
  }
}

###########################################################################################
sub sho_search {
  my ($target, $nn)=@_;
  print $c[4]."[!] Searching [$target] in Shodan...\n";
  shosearchadvise();
  adviseLimit();
  my $shoRes=getShoResults("$base/shodan/host/search?key=$shoapikey&query=$target&facets=$facets");
  sleep 1;
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
    print $c[3]."[+] Total : $i Results found\n";
	sleep 1;
    my $ip=$shoRes->{'ip'};
    my $country_name=$shoRes->{'country_name'};
    my $country_code=$shoRes->{'country_code'};
    my $region_name =$shoRes->{'region_name'};
    my $postal_code =$shoRes->{'postal_code'};

    if ( $ip ) { print $c[10]."[+] IP : $c[3] $ip \n"; }
    if ( $country_name ) { print $c[10]."[+] Country Name : $c[3] $country_name \n"; }
    if ( $country_code ) { print $c[10]."[+] Country Code : $c[3] $country_code \n"; }
    if ( $region_name ) { print $c[10]."[+] Area Code : $c[3] $region_name \n"; }
    if ( $postal_code ) { print $c[10]."[+] Postal Code : $c[3] $postal_code \n"; }
    if ( $shoRes->{'hostnames'}[0] ) {
      print $c[10]."[+] Hostnames : ";
      my @hostnames=@{ $shoRes->{'hostnames'} };
      foreach my $host (@hostnames) { print "$c[3] $host\t"; }
      print "\n";
    }
	
    print $c[4]."[!] Getting Data ...\n\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'matches'} };
    foreach my $found (@founds) {
      $n++;
      ltak();
	  print $c[1];
	  timer();
	  print " RESULT [$n/$i]\n\n";
	  sleep 1;
      my $ip=$found->{"ip_str"};
      my $country=$found->{"location"}{"country_name"};
      my $product=$found->{"product"};
      my $version=$found->{"version"};
      my $data=$found->{"data"};
      my $cpe=$found->{"cpe"};
      my $time=$found->{"timestamp"};
      my $last_updated=$found->{"last_update"};
      my $port=$found->{"port"};
      my $os=$found->{"os"};
      my $isp=$found->{"isp"};
      my $asn=$found->{"asn"};
      my $banner=$found->{"banner"};

      if ( $ip ) { print $c[10]."[+] IP : $c[3] $ip \n"; }
      if ( $port ) { print $c[10]."[+] Port : $c[3] $port \n"; }
	  
      print $c[10]."[+] Hostnames : ";
      my @hostnames2=@{ $found->{'hostnames'} };
      foreach my $host2 (@hostnames2) { print "$c[3] $host2\t"; }
      print "\n";
      if ( $country ) { print $c[10]."[+] Country : $c[3] $country \n"; }
      if ( $product ) { print $c[10]."[+] Product : $c[3] $product \n"; }
      if ( $version ) { print $c[10]."[+] Version : $c[3] $version \n"; }
      if ( $data ) { print $c[10]."[+] Data : \n\n$c[3]$data\n"; }
      if ( $time ) { print $c[10]."[+] Time : $c[3] $time \n"; }
      if ( $last_updated ) { print $c[10]."[+] Last Updated : $c[3] $last_updated \n"; }
	  if ( $cpe ) {
        my @founds4=@{ $found->{'cpe'} };
		print $c[10]."[+] CPE : \n"; 
        for my $f(@founds4) { 
		  print $c[10]."  $f \n";
		}
	  }
      if ( $os ) { print $c[10]."[+] OS : $os \n"; }
      if ( $isp ) { print $c[10]."[+] ISP : $c[3] $isp \n"; }
      if ( $asn ) { print $c[10]."[+] ASN : $c[3] $asn \n"; }
      if ( $banner ) { print $c[10]."[+] Banner : $c[3] $banner \n"; }
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
  my $shoRes=getShoResults("$base/shodan/host/$target?key=$shoapikey"); 
  if ($shoRes) {
    $shoRes=JSON->new->decode($shoRes);
    my $i=$shoRes->{'total'};
	timer();
	print $c[4]."[!] Getting [$target] Information ...\n";
	sleep 1;
	ltak();
    my $ip=$shoRes->{'ip'};
    my $country_name=$shoRes->{'country_name'};
    my $country_code=$shoRes->{'country_code'};
    my $region_name =$shoRes->{'region_name'};
    my $postal_code =$shoRes->{'postal_code'};

    if ( $ip ) { print $c[10]."[+] IP : $c[3] $ip \n"; }
    if ( $country_name ) { print $c[10]."[+] Country Name : $c[3] $country_name \n"; }
    if ( $country_code ) { print $c[10]."[+] Country Code : $c[3] $country_code \n"; }
    if ( $region_name ) { print $c[10]."[+] Area Code : $c[3] $region_name \n"; }
    if ( $postal_code ) { print $c[10]."[+] Postal Code : $c[3] $postal_code \n"; }
	
    print $c[10]."[+] Hostnames : \n";
	
    my @hostnames=@{ $shoRes->{'hostnames'} };
    foreach my $host(@hostnames) { print $c[10]."[+] Hostnames : $c[3] $host \t"; }
    print "\n";
    print $c[4]."[!] Getting Data ...\n\n";
	sleep 1;
    my $n=0;
    my @founds=@{ $shoRes->{'data'} };
    foreach my $found (@founds) {
      $n++;
      my $ip=$found->{"ip_str"};
      my $country=$found->{"location"}{"country_name"};
      my $product=$found->{"product"};
      my $version=$found->{"version"};
      my $data=$found->{"data"};
      my $cpe=$found->{"cpe"};
      my $time=$found->{"timestamp"};
      my $last_updated=$found->{"last_update"};
      my $port=$found->{"port"};
      my $os=$found->{"os"};
      my $isp=$found->{"isp"};
      my $asn=$found->{"asn"};
	  my $banner=$found->{"banner"};
      if ( $ip ) { print $c[10]."[+] IP : $c[3] $ip \n"; }
      if ( $port ) { print $c[10]."[+] Port : $c[3] $port \n"; }
	  
      print $c[10]."[+] Hostnames : ";
      my @hostnames2=@{ $found->{'hostnames'} };
      foreach my $host2 (@hostnames2) { print "$c[3] $host2\t"; }
      print "\n";
      if ( $country ) { print $c[10]."[+] Country : $c[3] $country \n"; }
      if ( $product ) { print $c[10]."[+] Product : $c[3] $product \n"; }
      if ( $version ) { print $c[10]."[+] Version : $c[3] $version \n"; }
	  
      if ( $data ) { print $c[10]."[+] Data : \n$c[3]$data\n"; }

      if ( $time ) { print $c[10]."[+] Time : $c[3] $time \n"; }
      if ( $last_updated ) { print $c[10]."[+] Last Updated : $c[3] $last_updated \n"; }
	  if ( $cpe ) {
        my @founds5=@{ $found->{'cpe'} };
        foreach my $f(@founds5) { print $c[10]."[+] CPE : $c[3] $f \t"; }
	  }
	  print "\n";
      if ( $os ) { print $c[10]."[+] OS : os \n"; }
      if ( $isp ) { print $c[10]."[+] ISP : $c[3] $isp \n"; }
      if ( $asn ) { print $c[10]."[+] ASN : $c[3] $asn \n"; }
      if ( $banner ) { print $c[10]."[+] Banner : $c[3] $banner \n"; }
	  ltak();
      if ( $n == $limit ) { last; }
    }
	sleep 1;
  }else{
    noResult();
  }
}

#############################################################################
sub adviseLimit {
  if ($limit == 500) {
    print $c[4]."[!] Max results is set to $limit use --limit to set other value!\n";
  }
}

#############################################################################
## GET RESULTS
sub getShoResults {
  my $u=$_[0];
  return $ua->get($u)->content;
}




1;

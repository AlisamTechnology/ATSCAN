package Shodan;

use strict;
use warnings;
use FindBin '$Bin';
use Print;
use Exploits;
use Getme;
use POSIX qw(strftime);
use URI::Escape;
use HTML::Entities;
use Subs;
use Dialog;	
use open ':std', ':encoding(UTF-8)';

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(shodan);

## Copy@right Alisam Technology see License.txt

my @c = Print::colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @AUTH = Exploits::AUTH();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT = Exploits::TT();
my $V_IP = Exploits::V_IP();

## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
my $noshodanres="No results found|Invalid IP";
my $base="https://api.shodan.io";

###########################################################################################
## GET IP
sub get_his_ip {
  my $tr = $_[0];
  my $ipp = new Validate();
  my $ips = $ipp->get_target_ip($tr);
  return $ips;
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
## RESULTS PAGES  #########################################################################
sub advisePages {
  print $c[4]."[!]$c[10] Use --level <number pages> to get more page results! ex: --level 2\n";
  sleep 1;
}

###########################################################################################
## GET RESULTS  ###########################################################################
sub getShoResults {
  my ($surl, $ua, $mlevel, $limit, $fullHeaders, $output) = @_; 
  my $shoRes;
  my $getme = new Getme();
  my $v_shoRes = $getme->navsearch($ua, $surl, $fullHeaders);		  

  #my $v_shoRes = $ua->navsearch($ua, $surl, $fullHeaders);
  if ($v_shoRes=~/(Invalid IP|Please upgrade your API|Can\'t connect to api|This server could not verify that you are authorized)/) {
    print $c[2]."[!] ERROR: $1\n";
    Print::separaBlocks();
  }else{
    $shoRes=$v_shoRes;
  }
  return $shoRes
}

###########################################################################################
## POSITIVE RESULTS  ######################################################################
sub sho_ckeck_total {
  my($total, $act, $tit, $credit, $limit)=@_;
  if ($total > 0) {
    if ($act) {
      print $c[3]."[!]$c[10] Listing ($total) of found results! ... \n";
      print $c[3]."[!] Getting data ...\n";
	}else{
	  if ($limit ne 500) {
	    print $c[3]."[!]$c[10] Listing ($limit) of found results defined by user! ...\n";
	  }else{
        print $c[3]."[!]$c[10] Listing ($total) of found results! \n";
	  }
	  if ($credit) { Dialog::credit(); }
	}
  }else{
    no_Result($tit);
  }
}

###########################################################################################
## PRINT  ##################################################################################
sub sho_print {
  my ($head, $key, $value, $sub, $output)=@_;
  if ($sub) { 
    print $c[4]."\n[!]$c[10] $sub ...\n"; 
	if (defined $output) { Print::printFile($output, "[+][+] $sub"); }
  }elsif ($head) { 
    print $c[10]."[+] $head: \n";
	if (defined $output) { Print::printFile($output, "   [+] $head:"); }
  }elsif (!$key) {
    print $c[10]."    -$c[3] $value \n";
	if (defined $output) { Print::printFile($output, "     -$value"); }
  }else{
    print $c[10]."[+] $key:$c[3] $value \n";
    if (defined $output) { Print::printFile($output, "   [+] $key: $value"); }
  }
}

###########################################################################################
## END PRINT      #########################################################################
sub end_hash_print {
  my ($shoRes, $output)=@_;
  my %shoRes = %$shoRes;	
  for my $f(keys %{$shoRes}) { 
	if ($shoRes->{$f}) {
	  my $fi=$shoRes{$f};
	  $f=do_name($f);
	  sho_print("", $f, $fi, "", $output);
	}
  }
}

###########################################################################################
## DO NAME        #########################################################################
sub do_name {
  my $name=$_[0];
  $name=~s/_/ /g;
  $name=ucfirst($name);
  return $name;
}

###########################################################################################
## LAST PRINT     #########################################################################
sub last_print {
  my ($f, $fi, $output)=@_;
  $f=do_name($f);    
  if (!$fi) { 
    print $c[10]."  + $f: \n";
    if (defined $output) { Print::printFile($output, "   + $f"); }
  }else{
    print $c[10]."    $f:$c[3] $fi\n";
    if (defined $output) { Print::printFile($output, "     $f: $fi"); }
  }
}

###########################################################################################
## VULNERABLITIES    ######################################################################
sub print_target_vulns {
  my ($vulns, $output)=$_[0];
  print $c[4]."[+]$c[10] Vulnerabilities:\n";  
  my %vulns = %$vulns;
  for my $f(keys %{$vulns}) {
	if ($vulns->{$f}) {
	  print $c[10]."  + $f:\n";
      if (defined $output) { Print::printFile($output, "  + $f:"); }
	  my $fi=$vulns{$f};
	  my $references=$fi->{'references'};
	  my $verified=$fi->{'verified'};
	  my $cvss=$fi->{'cvss'};
	  my $summary=$fi->{'summary'};
	  if ($references) { 
	    print $c[10]."    References:\n";
        if (defined $output) { Print::printFile($output, "    References:"); }
        my @referencies=@{$fi->{'references'}};
        foreach my $refer(@referencies) { sho_print("", "", $refer, "", $output); }
	  }
	  if ($verified) { last_print("Verified", "true", $output); }
	  if ($cvss) { last_print("Cvss", $cvss, $output); }
	  if ($summary) { last_print("Summary", $summary, $output); }
	}
	print $c[1]."  ............................................\n";
  }
}

###########################################################################################
## SEARCH BY STRINGS ######################################################################
sub end_array_print {
  my ($tit, @arrays, $output)=@_;
  if ($arrays[0]) {
	sho_print($tit, "", "", "", $output);
    foreach my $array(@arrays) { sho_print("", "", $array, "", $output); }
  }
}

###########################################################################################
## COUNT RESULTS     ######################################################################
sub get_n {
  my $n=$_[0];
  $n++;
  Print::separaBlocks();
  my $now = Subs::now();
  print $c[1]."[$now]";
  return $n;
}

###########################################################################################
## EXTERN COMMANDS   ######################################################################
sub sho_command {
  my ($ats, $commands, $popup)=@_;
  print " ...................................................\n";
  $ats=~s/://; 
  my $ext_cmd = Print::checkExternComnd($ats, \@{$commands});
  Print::extern_process($ats, $popup, $ext_cmd);
}

###########################################################################################
## QUERY TAGS     #########################################################################
sub sho_query_tags {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Searching in shodan query tags", $output);
  if ($mlevel eq 1) {Dialog::advisePages();}
  sleep 1;
  
  my @founds;
  for(my $npages=1;$npages<=$mlevel;$npages+=1) {
  my $surl = "$base/shodan/query/tags?key=$api_key";
    my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
    if ($shoRes) {
      $shoRes = Subs::_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "1", "query tags", "", $limit);
  my $n=0;
  foreach my $found (@founds) {
    $n=get_n($n);
    print " [$n/$total] QUERY TAG\n";
	sleep 1;
    my $value=$found->{"value"};
    my $count=$found->{"count"};
    if ( $value ) { sho_print("", "Value", $value, "", $output); }
    if ( $count ) { sho_print("", "Count", $count, "", $output); }
    if ( $n == $limit ) { last; }
  }
  Print::separaBlocks(); 
}

###########################################################################################
## LIST QUERIES   #########################################################################
sub sho_query {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Listening the saved search queries", $output);
  if ($mlevel eq 1) {Dialog::advisePages(); }
  my @founds;
  for(my $npages=1;$npages<=$mlevel;$npages+=1) {
    my $surl = "$base/shodan/query?key=$api_key&page=$npages";
    my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
    if ($shoRes) {
      $shoRes = Subs::_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "", "saved search queries", "", $limit);
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
      if ($key) { 
	    print $c[10]."[+] $elements3[$in1]:$c[3] $key \n";
		if (defined $output) { Print::printFile($output, "[+] $elements3[$in1]: $key "); }
	  }
	}
    my $tag=$found->{"tags"};
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  end_array_print("Tags", @tags);
	}
    if ( $n == $limit ) { last; }
  }
  Print::separaBlocks(); 
}

###########################################################################################
## TOKENS         #########################################################################
sub sho_tokens {
  my ($shotokens, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  my @shotokens = @{$shotokens};
  sho_print("", "", "", "Determining used filters and parameters for given string", $output);
  my $surl = "$base/shodan/host/search/tokens?key=$api_key&query=$shotokens";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  sleep 1;
  if ( $shoRes ) {
    my @shoRes=split(",", $shoRes);
	my ($i, $n)=1;
	$n=get_n($n);
	print " STRING [$i/".scalar @shotokens."] ($shotokens)\n";
	for my $f(@shoRes) {
	  $i++;	  
      if ( $f =~ /\"string\":\s\"(.*)\"/ ) {
	    sho_print("", "String", $1, "", $output) if $1;
      }
      if ( $f =~ /\"attributes\":\s\{(.*)\}/g ) {
	    sho_print("", "Attributes", $1, "", $output) if $1;
      }
      if ( $f =~ /\"errors\":\s\[(.*)\]/g ) {
	    sho_print("", "Errors", $1, "", $output) if $1;
      }
      if ( $f =~ /\"filters\":\s\[\"(.*)\"\]/g ) {
	    sho_print("", "Filters", $1, "", $output) if $1;
      }
	}
  }else{
    print $c[2]."[!] ";
    no_Result($shotokens);
  }
  Print::separaBlocks(); 
}

###########################################################################################
## LIST SERVICES  #########################################################################
sub sho_services {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Listening all services that Shodan crawls", $output);
  my $surl = "$base/shodan/services?key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  sleep 1;
  if ( $shoRes ) {
    my $n=0;
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
      $n++;
	  sleep 1;
	  sho_print("", "Port", $1, "", $output);
	  sho_print("", "Name", $2, "", $output);
	  print $c[10]."..........................................\n";
      if ( $n == $limit ) { last; }
    }
  }else{
    print $c[2]."[!] ";
    no_Result("shodan setrvices");
  }
  Print::separaBlocks(); 
}

###########################################################################################
## MY IP ADDRESS  #########################################################################
sub honeyscore {
  my ($shohoneyscore, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Calculating honeypot probability score", $output);
  sleep 1;
  my $surl = "$base/labs/honeyscore/$shohoneyscore?key=$api_key";
  my ($shoRes, $i)=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes ) {
    sho_print("", "Score", $shoRes, "", $output);
  }else{
    no_Result($shohoneyscore);
  }
  Print::separaBlocks(); 
}

###########################################################################################
## MY IP ADDRESS  #########################################################################
sub shomyip {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Getting your IP address", $output);
  sleep 1;
  my $surl = "$base/tools/myip?key=$api_key";
  my ($shoRes, $i)=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes =~ /"(.*)"/ ) {
	sho_print("", "IP", $1, "", $output);
  }else{
    no_Result("your IP");
  }
  Print::separaBlocks(); 
}

###########################################################################################
## API INFO       #########################################################################
sub shoapinfo {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Getting your API info", $output);
  sleep 1;
  my $surl = "$base/api-info?key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ($shoRes) {
    $shoRes = Subs::_json($shoRes);
    end_hash_print($shoRes);
  }else{
    no_Result("your API Info");
  }
  Print::separaBlocks();
}

###########################################################################################
## DNS RESOLVE    #########################################################################
sub sho_dns_resolve {
  my ($hostnames, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $popup, $commands) = @_;  
  sho_print("", "", "", "DNS resolve Lookup for [$hostnames]", $output);
  $hostnames = get_his_ip($hostnames) if $hostnames !~/$V_IP/;
  sleep 1;
  my $surl = "$base/dns/resolve?hostnames=$hostnames&key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": "(.*?)"/migs ) {
	  sleep 1;
	  sho_print("", "Hostname", $1, "", $output);
	  sho_print("", "IP", $2, "", $output);
      if ($commands && scalar @{$commands} > 0) {  sho_command($2, $commands, $popup); }	
    }
  }else{
    no_Result($hostnames);
  }
  Print::separaBlocks(); 
}

###########################################################################################
## DNS REVERSE    #########################################################################
sub sho_dns_reverse {
  my ($ip, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $popup, $commands) = @_;  
  sho_print("", "", "", "DNS reverse Lookup for [$ip]", $output);
  $ip = get_his_ip($ip) if $ip !~/$V_IP/;
  sleep 1;
  my $surl = "$base/dns/reverse?ips=$ip&key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes ) {
    while ( $shoRes =~ /"(.*?)": \["(.*?)"\]/migs ) {
	  sleep 1;
	  sho_print("", "IP", $1, "", $output);
	  sho_print("", "Hostname", $2, "", $output);
      if ($commands && scalar @{$commands} > 0) {  sho_command($2, \@{$commands}, $popup); }	
    }
  }else{
    no_Result($ip);
  }
  Print::separaBlocks();
}

###########################################################################################
## SHODAN PORTS   #########################################################################
sub sho_ports {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Getting all used shodan api Ports", $output);
  sleep 1;
  my $surl = "$base/shodan/ports?key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes ) {
	my $i=()=$shoRes=~/\Q,/g;
	sho_print("", "Total ports", $i+1, "", $output);
	sleep 1;
    $shoRes=~s/(\]|\[)//g;
    sho_print("", "Ports", $shoRes, "", $output);	
  }else{
    no_Result("ports");
  }
  Print::separaBlocks();
}

###########################################################################################
## SHODAN PROTOCOLS   #####################################################################
sub sho_protos {
  my ($api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Listing protocols that can be used when performing on-demand Internet", $output);
  sleep 1;
  my $surl = "$base/shodan/protocols?key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ( $shoRes ) {
    $shoRes = Subs::_json($shoRes);
    end_hash_print($shoRes);
  }else{
    no_Result("protocols");
  }
  Print::separaBlocks();
}

###########################################################################################
## SEARCH COUNT   #########################################################################
sub sho_count {
  my ($query, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $facets) = @_;  
  Dialog::shosearchadvise();
  sho_print("", "", "", "Shodan api Search Count for [$query]", $output);
  sleep 1;
  my $surl = "$base/shodan/host/count?key=$api_key&query=$query&facets=$facets";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);  
  if ($shoRes) {
    $shoRes = Subs::_json($shoRes);
    my $i=$shoRes->{'total'};
	if ($i) {
	  sho_print("", "Total", $i, "", $output);
    }else{
      no_Result($query);
	}
  }
  Print::separaBlocks();
}

###########################################################################################
##  QUERY SEARCH  #########################################################################
sub sho_query_search {
  my ($query, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output) = @_;  
  sho_print("", "", "", "Searching [$query] in saved search queries", $output);
  if ($mlevel eq 1) { Sialog::advisePages(); }
  Dialog::shosearchadvise();
  sleep 1;
  
  my @founds;
  for(my $npages=0;$npages<=$mlevel;$npages+=1) {
    my $surl = "$base/shodan/query/search?key=$api_key&query=$query&page=$npages";
    my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
    if ($shoRes) {
      $shoRes = Subs::_json($shoRes);
      my @found=@{ $shoRes->{'matches'} };
	  push @founds, @found;
	}
  }
  my $total=scalar @founds;
  sho_ckeck_total($total, "1", $query, "", $limit);
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
      if ($key) { 
	    print $c[10]."[+] $elements3[$in3]:$c[3] $key \n";
	    if (defined $output) { Print::printFile($output, "[+] $elements3[$in3]: $key "); }
	  }
	}
	
    my $tag=$found->{"tags"};
	if ($tag) {
      my @tags=@{ $found->{'tags'} };
	  end_array_print("Tags", @tags, $output);
	}
    if ( $n == $limit ) { last; }
  }
  Print::separaBlocks(); 
}

###########################################################################################
## SEARCH BY STRINGS ######################################################################
sub sho_search {
  my ($target, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $popup, $commands, $facets) = @_;  
  sho_print("", "", "", "Searching [$target] in Shodan api search", $output);
  Dialog::shosearchadvise(); 
  Dialog::adviseLimit($limit);
  for(my $npages=1;$npages<=$mlevel;$npages+=1) {
    my $surl = "$base/shodan/host/search?key=$api_key&query=$target&facets=$facets&page=$npages";
    my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
    sleep 1;
    if ($shoRes) {
      $shoRes = Subs::_json($shoRes); 
      my $i=$shoRes->{'total'};
      print $c[3]."[+] Total: $i Results found\n" if $i;
	  sleep 1;
      my $n=0;
      my @founds=@{ $shoRes->{'matches'} };
      my $total=scalar @founds;
	  sho_ckeck_total($total, "", $target, "1", $limit);
	  print "\n";
      foreach my $found (@founds) {
	    $n=get_n($n);
		if ($limit ne 500) {
	      print " RESULT [$n/$limit]\n";
		}else{
	      print " RESULT [$n/$total]\n";
		}
	    sleep 1;
		check_it($found, $popup, @{$commands}, $output);
	    my $vulns=$found->{"vulns"};
	    if ( $vulns ) {
	      print_target_vulns($vulns, $output);
	    }
        if ( $n == $limit ) { last; }
	  }
      Print::separaBlocks();
    }
  }
}

###########################################################################################
## SEARCH BY IP OR HOST  ##################################################################
sub sho_ip {
  my ($target, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $popup, $commands) = @_;
  sho_print("", "", "", "Getting [$target] Information", $output);
  $target = get_his_ip($target) if $target !~/$V_IP/;
  my $surl = "$base/shodan/host/$target?key=$api_key";
  my $shoRes=getShoResults($surl, $ua, $mlevel, $limit, $fullHeaders);
  if ($shoRes) {
    $shoRes = Subs::_json($shoRes);
	my $in3=-1;
	my @elements3=("IP", "Country", "Region", "Postal code", "Org");
	my @elements23=("ip_str", "country_name", "region_name", "postal_code", "org");
	for my $element23(@elements23) {
	  $in3++;
	  my $key=$shoRes->{$element23};
      if ($key) { sho_print("", $elements3[$in3], $key, "", $output); }
	}
    my $hostnam =$shoRes->{'hostnames'};
	if ($hostnam) {
	  my @hostnam=@{ $shoRes->{'hostnames'} };
	  end_array_print("Hostnames", @hostnam, $output);
	}
    my $n=0;
    my @founds=@{ $shoRes->{'data'} };
    my $total=scalar @founds;
    foreach my $found (@founds) {
      $n++;
	  if ($n eq 1) {
	    my $vulns=$found->{"vulns"};
	    if ( $vulns ) {
	      print_target_vulns($vulns, $output);
		}
        Print::separaBlocks();
        print $c[4]."[!] Getting Data ...\n";
		sho_ckeck_total($total, "", $target, "", $limit);
	  }
	  sleep 2;
	  print "$c[1]......................................\n";
	  check_it($found, $popup, @{$commands}, $output);
      if ( $n == $limit ) { last; }
    }
    Print::separaBlocks();
  }
}

###########################################################################################
##  GET VALUES           ##################################################################
sub check_it {
  my ($found, $popup, $commands, $output) = @_;
  my $ats="";
  my $in=-1;
  my @elements=("IP", "Port", "Product", "Version", "Cps", "Time", "Last update", "Os", "Isp", "Asn", "Hash", "Sitemap hash", "Transport");
  my @elements2=("ip_str", "port", "product", "version", "cps", "timestamp", "last_update", "os", "isp", "asn", "hash", "sitemap_hash", "transport");
  for my $element2(@elements2) {
	$in++;
	my $key=$found->{$element2};
    if ($key) { 
      sho_print("", $elements[$in], $key, "", $output);
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
	end_array_print("Hostnames", @hostnames2, $output);
  }
  if ($domains) { 
	my @domains=@{ $found->{'domains'} };
	end_array_print("Domains", @domains, $output);
  }
  if ($location) {
	end_hash_print($location);
  }
  if ( $cpe ) {
    my @cpe=@{ $found->{'cpe'} };
	end_array_print("CPE", @cpe, $output);
  }
  if ( $data ) { sho_print("", "Data", $data, "", $output); }	  
  if ( $banner ) { sho_print("", "Banner", $banner, "", $output); }
  if ($commands && scalar @{$commands} > 0) {  sho_command($ats, \@{$commands}, $popup); }	
}

###########################################################################################
## FILTERS      ###########################################################################
sub shodan_help {
  print $c[11]."[+] SHODAN SEARCH PARAMETERS:\n\n";
  Dialog::shosearchqueryhelp();
  Dialog::printshohelp();
  Print::separaBlocks();
  Dialog::shosearchfacetshelp();
  Dialog::printshohelp();  
  Dialog::shoserachpagehelp();
  Dialog::shosearchminifyhelp();
  Print::separaBlocks();
}

###########################################################################################
###########################################################################################
## MAIN      ##############################################################################
sub shodan {
  my ($ua, $dork, $Target, $mlevel, $limit, $fullHeaders, $output, $shocount, $shoquery, 
					$shoreverse, $shoapiInfo, $shoports, $shoprotos, $shotokens, $shohoneyscore, 
					$shofilters, $shomyip, $facets, $shoquerySearch, $shoqueryTags, $shoservices, 
					$shoresolve, $shos, $api_key, $commands, $popup) = @_;
  
  my @sho = @{$shos};
  $mlevel=1 if !$mlevel;
  $facets = "" if !$facets;

  if (defined $dork) {
    if (defined $shoquerySearch) { for (@sho) { sho_query_search($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output); } }
	elsif (defined $shotokens) { for (@sho) { sho_tokens($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output); } }
	elsif (defined $shocount) { for (@sho) { sho_count($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $facets); } }
	else{ for (@sho) { sho_search($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $commands, $popup, $facets); } }
  }elsif (defined $Target) {
    if ( $shoresolve ) { for (@sho) { sho_dns_resolve($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $commands, $popup); } }
	elsif ( $shoreverse ) { for (@sho) { sho_dns_resolve($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $commands, $popup); } }
	else{ for (@sho) { sho_ip($_, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output, $commands, $popup); } }
  }else{
    if ( $shoports ) { sho_ports($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shoprotos ) { sho_protos($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shoqueryTags ) { sho_query_tags($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shoquery ) { sho_query($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shoservices ) { sho_services($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shomyip ) { shomyip($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shoapiInfo ) { shoapinfo($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shofilters ) { shodan_help($api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
    elsif ( $shohoneyscore ) { honeyscore($shohoneyscore, $api_key, $ua, $mlevel, $limit, $fullHeaders, $output); }
	else{ Dialog::sho_menu(); }
    ######################################
    print $c[3]."[!] Results saved in [$output]\n" if defined $output;
  }
}

###########################################################################################
## END MAIN     ###########################################################################
###########################################################################################

1;

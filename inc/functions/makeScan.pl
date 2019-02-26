#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## MAKE SCAN
sub makeSscan { 
  my ($ct, $dt, $et, $ar, $v_ar, $title, $paylNote, $result, $reverse, $reg, $comnd, $isFilter, $data, $no)=@_;
  our (@c, @DS, @TT, @aTscans, @aTsearch, @userArraysList, @replaceParts, $limit, $payloads, $exploit, $shell, $p, $expHost, $expIp,
       $replaceFROM, $replace, $getlinks);
  @aTscans=();
  ptak();
  checkHeaders($ct, $dt, $et);  
  if (!$no) { 
    print $c[11]."$title"; scanTitleEnd(); title($title); 
  }
  print $c[4]."$paylNote" if (defined $paylNote and !defined $payloads);
  my @arr;
  our ($xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip);
  my @noresults4=($xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip);
  my $i4;
  for (@noresults4) { $i4="1" if defined $_; }
  if ($i4) {
    if (defined $payloads) { @arr=@userArraysList; }
    else{ @arr=@{ $ar }; }
  }
  my @filter=@{ $v_ar };
  my $filter=join("|", @filter); 
  @aTsearch=checkDuplicate(@aTsearch);
  if (defined $getlinks) { @aTsearch=doDeepSearch(@aTsearch); }
  my $lc=scalar @aTsearch;
  my $count=0;
  for my $URL(@aTsearch) {
    $URL=~s/\s+$//;
    my $o=OO();
    if ($o>=$limit) { last; }
    else{
      $count++;
      print "\n" if $count>1;
      sleep (1);
      points(); dpoints(); points();
      print $c[1]."    $DS[9]  "; print $c[10].$c[7]."[$count/$lc] $URL\n";
      if (defined $replace || defined $replaceFROM) {
        checkVreplace();
        if ($URL!~/$replaceParts[0]/) {
          print $c[1]."    SCAN    ".$c[2]."No [$replaceParts[0]] found!\n";
          next;
        }
      }
      $URL=control($URL);
      if (!@arr) {
        if (!$result) {
          if (defined $exploit || defined $expHost || defined $expIp) {
            getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, "");
          }else{
            my $URL1=$URL; $URL1=~s/ //g;
            if ($reg) { doScan($URL1, $filter, "", "", $reg, "", "", ""); }
            elsif ($data) { doScan($URL1, $filter, "", "", "", "", "", $data); }
            else{ doScan($URL1, $filter, "", "", "", "", $isFilter, ""); }
          }
        }else{
          if (defined $exploit || defined $expHost || defined $expIp) {
            getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, "");
          }
          else{ my $URL1=$URL; $URL1=~s/ //g;
            doScan($URL1, $filter, $result, "", "", "", $isFilter, $data);
          }
        }
      }else{
        my $pm=0;
        foreach my $arr(@arr) {
          my $o=OO();
          if ($o < $limit) {
            $pm++;
            points() if $pm>1;
            print $c[1]."    $DS[5]  $c[10] [$pm/".scalar @arr."] $arr"; print $shell if defined $shell; print "\n";
            if ((defined $exploit || defined $expHost || defined $expIp) || (defined $p)) {
              getExploitArrScan($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, scalar @arr, $data, "");
            }else{
              if ($reverse) {
                my $protocol=getTargetProtocol($URL);
                $URL=removeProtocol($URL);
                my $URL1=$arr.$URL; $URL1=~s/ //g;
                $URL1="$protocol//$URL1";
                doScan($URL1, "", "", $reverse, "", "", $isFilter, $data); }
              else{
                my $URL1=$URL.$arr; $URL1=~s/ //g;
                doScan($URL1, $filter, "", "", "", "", $isFilter, $data);
              }
            }
          }
        }
      }
    }
  }  
  ltak();
  endScan();
}

## DEEP SEARCH
sub doDeepSearch {
  our ($ua, $nolisting, @aTsearch, @c, @DT);
  my @links=@_;
  my $nodeeplisting="q=|.png|.jepg|.css|.js|jpg|.xml|utm_|doubleclick.|ie=UTF";
  @links=checkDuplicate(@links);
  my @deep=();
  print $c[4]."[!]$c[10] Scraping engine targets...\n";
  for my $link(@links) {
    if (substr($link, -1) eq "\/") { $link=chop($link); }
	ckeck_ext_founc("1");
    my $linkSearch=$ua->get($link) or die "cannot get $link\n";
    $linkSearch->as_string;
    my $linkRes=$linkSearch->content;
	while ($linkRes=~m/href=\"([^>\"\<\'\(\)\#\,\s]*)/g) {
	  my $llk=$1;
	  if ($llk!~/$nolisting/ and $llk!~/$nodeeplisting/) {
	  
	    if ($llk!~/^https?:\/\//) { 
		  $llk="$link/$llk";
		}
		my $cllk=$llk;
		$llk=removeProtocol($llk);
	    $llk=~s/\/\//\//;
		if ($cllk=~/^https/) {
		  $llk="https://$llk";
		}else{
		  $llk="http://$llk";
		}
	  
		my $vllk=validateURL($llk);
		if ($vllk) { push @deep, $llk; }
	  }
	}
  }
  @deep=checkDuplicate(@deep);
  push @aTsearch, @deep;
  print $c[3]."[i] ".scalar @aTsearch." $DT[4]\n";
  return @aTsearch;
}

1;

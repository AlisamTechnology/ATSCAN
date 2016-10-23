#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## MAKE SCAN
sub makeSscan { 
  my ($ct, $dt, $et, $ar, $v_ar, $title, $paylNote, $result, $reverse, $reg, $comnd, $isFilter, $data, $no)=@_;
  our (@c, @DS, @aTscans, @aTsearch, @userArraysList, $limit, $payloads, $exploit, $shell, $p);
  @aTscans=();
  ptak();
  checkHeaders($ct, $dt, $et);  
  if (!$no) { print $c[11]."$title"; scanTitleEnd(); title($title); }
  print $c[4]."$paylNote" if (defined $paylNote and !defined $payloads);
  my @arr;
  if (defined $payloads) { @arr=@userArraysList; }
  else{ @arr=@{ $ar }; }  
  my @filter=@{ $v_ar };
  my $filter=join("|", @filter); 
  @aTsearch=checkDuplicate(@aTsearch);
  my $lc=scalar(grep { defined $_} @aTsearch);
  my $count=0;
  for my $URL(@aTsearch) {
    $URL=~s/\s+$//;
    my $o=OO();
    if ($o>=$limit) { last; }
    else{
      $count++;
      points(); dpoints(); points();
      $URL=checkUrlSchema($URL);
      $URL=control($URL);
      print $c[1]."    $DS[9]  "; print $c[10].$c[7]."[$count/$lc] $URL\n";
      if (!@arr) {     
        if (!$result) {
          if (defined $exploit) { getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, "");
          }else{
            my $URL1=$URL; $URL1=~s/ //g;
            if ($reg) { doScan($URL1, $filter, "", "", $reg, "", "", ""); }
            elsif ($comnd) { doScan($URL1, $filter, "", "", "", $comnd, "", ""); }
            elsif ($data) { doScan($URL1, $filter, "", "", "", "", "", $data); }
            else{ doScan($URL1, $filter, "", "", "", "", $isFilter, ""); }
          }
        }else{
          if (defined $exploit) { getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, ""); }
          else{ my $URL1=$URL; $URL1=~s/ //g; doScan($URL1, $filter, $result, "", "", "", $isFilter, $data); }
        }
      }else{
        my $pm=0;
        foreach my $arr(@arr) {
          my $o=OO();
          if ($o<$limit) {
            $pm++;
            points() if $pm>1;
            print $c[1]."    $DS[5]  $c[10] [$pm/".scalar(grep { defined $_} @arr)."] $arr"; print $shell if defined $shell; print "\n";
            if ((defined $exploit) || (defined $p)) {
              getExploitArrScan($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, scalar(grep { defined $_} @arr), $data, "");
            }else{
              if ($reverse) { $URL=removeProtocol($URL); my $URL1=$arr.$URL; $URL1=~s/ //g;  $URL1=checkUrlSchema($URL1); doScan($URL1, "", "", $reverse, "", "", $isFilter, $data); }
              else{ my $URL1=$URL.$arr; $URL1=~s/ //g; doScan($URL1, $filter, "", "", "", "", $isFilter, $data); }
            }
          }
        }
      }
    }
  }  
  ltak(); if (!$comnd and !$data) { endScan(); }
}

1;

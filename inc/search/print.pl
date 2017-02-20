#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($limit, $get, $post, $Hstatus, $validText, $content, $beep, $output, $msource, @data, @c, @DT, @DS, @TT, @aTsearch, @aTscans);

## BUILD SCAN RESULTS LISTS
sub buildPrint {
  my ($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my $form;
  my $o=OO();
  if ($o<$limit) {
    if ($data) {
      my $lc2=scalar(grep { defined $_} @data);
      my $nt;
      for my $form(@data) {
        $form=~s/\s+$//g;       
        my $o=OO();
        if ($o<$limit) {
          $nt++; points() if $nt>1;
          print $c[1]."    DATA    ".$c[10]."[$nt/$lc2] $form\n";
          $form=~s/^\[DATA\]//g;     
          if (defined $post) {
            $form=~s/:/'=>'/g; $form=~s/\[DATA\]/', '/g; $form="\"".$form."\"";
          }elsif(defined $get) { $form=~s/\:/\=/g; $form=~s/\[DATA\]/&/g; }
          my ($response, $status, $html)=browseUrl($URL1, $form);   
          printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $form);
        }
      }
    }else{
      my ($response, $status, $html)=browseUrl($URL1, "");
      printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, "");
    }
  }
}

## BUILD SCAN RESULTS LISTS
sub titleSCAN {
  my $o=OO();
  if ($o<$limit) { 
    if ((defined $Hstatus) || (defined $validText)) {
      print $c[1]."    $DS[12]   ";
      if (defined $validText) { print $c[10]."$validText"; }
      if (defined $Hstatus) { print $c[10]."$DS[13] $Hstatus"; }
      print "\n";
    }
    print $c[1]."    $DS[4]    ";
  }
}

## NO RESULTS FOUND
sub noResult { print $c[2]."$DT[1]\n"; }

## CHECK RESULTS TO SCAN
sub printResults { 
  my ($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my $o=OO();
  if ($o<$limit) {
    if ($result) {
      titleSCAN() if $result && (defined $Hstatus || defined $validText);
      validateResult($URL1, $status, $html, $response, $result);
    }
    elsif ($reg) {
      getRegex($URL1, $html, $reg); }
    elsif ($comnd) {
      my $cV=checkValidation($URL1, $status, $html, $response, "");
      print "$c[1]    $DT[24]   $c[10]$comnd\n";
      titleSCAN();
      if ($cV) { getComnd($URL1, $comnd); }else{ noResult(); }
    }elsif ($data) {
      titleSCAN(); formData($URL1, $html, $status, $response); 
    }else{
      titleSCAN();
      if ($isFilter) {
        if ($html=~/$filter/) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }elsif ($reverse) {  
        if ($status==200) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }else{
        if ($response->is_success and !$response->previous) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }
    }
  }
}

our ($exploit, $replace, $noQuery);
## VALIDATE RESULTS
sub validateResult {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV=checkValidation($URL1, $status, $html, $response, "");        
  if ($cV) { doPrint($URL1, $result, $html); }else{ noResult() unless (($result && (!defined $Hstatus && !defined $validText)) || ($result && (defined $exploit || defined $replace || defined $noQuery)&&(!defined $Hstatus && !defined $validText))); }
}

## PRINT POST DATA RESULTS
sub formData {
  my ($URL1, $html, $status, $response)=@_;
  my $o=OO();
  if ($o<$limit) {
    if (defined $Hstatus or defined $validText) {
      validateResult($URL1, $status, $html, $response, "");
    }else{
      if (length($html)>5) { stakScan(); print $c[8]."$html\n"; }
      else{ print "$c[2]$TT[18]\n"; }
    }
  }
}

## CHECK VALIDATION SEARCH RESULTS / TARGETS LIST
sub checkValidation {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV;
  if (defined $Hstatus) { if ($status==$Hstatus) { $cV=$URL1; }else{ $cV=""; } }
  elsif (defined $validText) { if ($html=~/$validText/) { $cV=$URL1; }else{ $cV=""; } }
  else{ $cV=$URL1; }
  return $cV;
}

## PRINT RESULTS
sub doPrint {
  my ($URL1, $result, $html)=@_;
  my $o=OO();
  if ($o<$limit) {
    print $c[3]."$URL1\n" unless (($result && (!defined $Hstatus && !defined $validText)) || ($result && (defined $exploit || defined $replace || defined $noQuery)&&(!defined $Hstatus && !defined $validText)));
    if (defined $beep || $beep) { print chr(7); } saveme($URL1, "");
    if (defined $content) { dpoints(); print $c[10]."$html\n"; }
    if (defined $msource) { printSource($URL1, $html); }   
  }
}

## PRINT SOURCE CODE
sub printSource {
  my ($URL1, $html)=@_;
  $URL1=removeProtocol($URL1);
  $URL1=~s/\//\-/g;
  my $fl="$msource/$URL1.html";
  open (FILE9, '>', "$fl");
  binmode(FILE9, ":utf8");
  print FILE9 "$html\n"; close(FILE9);
  print $c[1]."    Source $c[4] (".length($html)." bytes) Saved to $fl\n";
}

## END SCAN
sub endScan {
  my $o=OO();
  if ($o>0) {
    countResultLists();
    if (defined $output) { print $c[4]."[!] $DT[13] $output!\n"; }
  }else{ negative(); }
}

## COPY SCAN TO TARGETS LIST
sub doUnlink {
  my $o=OO();
  if ($o>0) { @aTsearch=(); push @aTsearch, @aTscans; @aTscans=(); }
}

1;

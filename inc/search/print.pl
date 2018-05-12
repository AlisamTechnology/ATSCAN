#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($limit, $get, $post, $Hstatus, $validText, $noExist, $content, $beep, $output, $msource, $notIn, $expHost, $expIp, $command, $data, $validShell,
     @c, @DT, @DS, @TT, @aTsearch, @aTscans, @data);

## BUILD SCAN RESULTS LISTS
sub buildPrint {
  my ($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my $o=OO();
  if ($o<$limit) {
    if ($data) {
      @data=();
      if ($data=~/WORDLIST:/) {
        my (@parts_data, @list_data, @noList_data)=();
        @parts_data=split("\,", $data);
        my $w=0;
        for my $part_data(@parts_data) {
          if ($part_data!~/WORDLIST:/) {
            $w++;
            push @noList_data, $part_data;
          }else{
            push @list_data, $part_data;
          }
        }
        if ((scalar(grep { defined $_} @list_data)) > 1 ) { data_alert(); }
        my $noList_data=join(", ", @noList_data);
        for my $list_data(@list_data) {
          my $dataPath=$list_data;
          $dataPath=~s/(\"|\')//g;
          $dataPath=~s/(.*)WORDLIST://g;
          open(F5, $dataPath) or advise_no_file($dataPath);
          while (my $f=<F5>) {
            chomp $f;
            (my $dataPart=$list_data)=~s/WORDLIST\:([^\"\']*)/$f/g;
            push @data, "$dataPart, $noList_data";
          }
          close(F5);
        }
      }else{
        push @data, $data;
      }
      my $i=0;
      my $iScalar=scalar(grep { defined $_} @data);
      for my $datas(@data) {
        $i++;
        if ($i > 1) { print "            "; stakScan(); };
        print $c[1]."    DATA    ".$c[10]."[$i/$iScalar] $datas\n";
        my ($response, $status, $html)=browseUrl($URL1, $datas);   
        printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $datas);
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
      if (defined $noExist) { print $c[10]."None: "; }
      if (defined $validText) { print $c[10]."$validText "; }
      if (defined $Hstatus) { print $c[10]."$DS[13] $Hstatus "; }
      print "\n";
    }
    if (defined $notIn) { print $c[1]."    Filter  $c[10]\[None: $notIn]\n"; }
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
      titleSCAN() if $result && (defined $Hstatus || defined $validText || defined $notIn);
      validateResult($URL1, $status, $html, $response, $result);
    }
    elsif ($reg) {
      getRegex($URL1, $html, $reg); }
    elsif ($data) {
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
  if ($cV) {
    doPrint($URL1, $result, $html);
  }else{
    noResult() unless (($result && (!defined $Hstatus && !defined $validText && !defined $notIn && !defined $validShell)) || ($result && (defined $exploit || defined $expIp || defined $expHost || defined $replace || defined $noQuery)&&(!defined $Hstatus && !defined $validText && !defined $notIn && !defined $validShell))); }
}

## PRINT POST DATA RESULTS
sub formData {
  my ($URL1, $html, $status, $response)=@_;
  my $o=OO();
  if ($o<$limit) {
    if (defined $Hstatus or defined $validText or defined $notIn or defined $validShell) {
      validateResult($URL1, $status, $html, $response, "");
    }else{
      if ($status eq "200") {
        if (defined $beep || $beep) { print chr(7); }
        saveme($URL1);
        print $c[3]."$URL1\n";
        checkExtratScan($URL1, $html);
      }else{
        noResult();
      }
    }
  }
}
##
sub ifShellSuccess {
  my ($URL1, $validShell)=@_;
  my $ccv="";
  $URL1=cleanURL($URL1);
  $URL1="$URL1/$validShell";
  my $ua = LWP::UserAgent->new;
  my $reShell = $ua->get("http://$URL1");
  if ($reShell->is_success and ($reShell->code eq "200")) {
    $ccv="1";
  }
  return $ccv;
}


## CHECK VALIDATION SEARCH RESULTS / TARGETS LIST
sub checkValidation {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV=$URL1;
  if (defined $noExist || defined $Hstatus || $validText) {
    if (defined $noExist) {
      if (defined $Hstatus) { if ($status == $Hstatus) { $cV=""; } }
      if (defined $validText) { if ($html=~m/^$validText$/i) { $cV=""; } }
    }else{
      if (defined $Hstatus) { if ($status ne $Hstatus) { $cV=""; } }
      if (defined $validText) { if ($html!~m/^$validText$/i) { $cV=""; } }
    }
  }
  if (defined $notIn) { if (index($html, $notIn) != -1) { $cV=""; } }
  if (defined $validShell) {
    my $isUploaded=checkUloadedShell($URL1);
    if (!$isUploaded) { $cV=""; }
  }
  return $cV;
}

## PRINT RESULTS
sub doPrint {
  my ($URL1, $result, $html)=@_;
  my $o=OO();
  if ($o<$limit) {
    print $c[3]."$URL1\n" unless (($result && (!defined $Hstatus && !defined $validText && !defined $notIn && !defined $validShell)) || ($result && (defined $exploit || defined $expIp || defined $expHost || defined $replace || defined $noQuery)&&(!defined $Hstatus && !defined $validText && !defined $notIn && !defined $validShell)));
    if (defined $beep || $beep) { print chr(7); }
    saveme($URL1, "");
    checkExtratScan($URL1, $html);
  }
}

## EXTRAT USER SCAN
sub checkExtratScan {
  my ($URL1, $html)=@_;
  if (defined $content) { points(); print $c[10]."$html\n"; }
  if (defined $msource) { printSource($URL1, $html); }
  if (defined $command) { checkExternComnd($URL1, $command); }
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
    if (defined $output) { print $c[4]."[i] $DT[13] $output!\n"; }
  }else{ negative(); }
}

1;

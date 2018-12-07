#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($limit, $get, $post, $Hstatus, $validText, $content, $beep, $output, $msource, $notIn, $expHost, $expIp, $command, $all,
     $data, $validShell, $zoneH, @c, @DT, @DS, @TT, @aTsearch, @aTscans, @data, @validTexts, @notIns, @exists, @notExists, @ZT);

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
        print $c[1]."    $ZT[10]    ".$c[10]."[$i/$iScalar] $datas\n";
        my ($response, $status, $html)=browseUrl($URL1, $datas);   
        printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $datas);
      }
    }else{
      my ($response, $status, $html)=browseUrl($URL1, "");
      printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, "");
    }
  }
}

## PRINT VALIDATED STRINGS
sub printValidated {
  my $ins=$_[0];
  my @ins=@{$ins};
  print $c[1]."    $DS[12]   ";
  for my $in(@ins) {
    print $c[4]."[$in]";
  }
  print "\n";
}

## BUILD SCAN RESULTS LISTS
sub titleSCAN {
  my $o=OO();
  my ($html, $status)=@_;
  if ($o<$limit) {
    my (@in, @noins)=();
    if (defined $validText) {
      for my $ffff(@validTexts) {
        if ($html=~m/\b$ffff\b/) {
          push @in, $ffff;
        }
      }
      if (defined $all) {
        if (scalar(grep { defined $_} @in) eq scalar(grep { defined $_} @validTexts)) {
          printValidated(\@in);
        }             
      }else{
        if (scalar(grep { defined $_} @in) > 0) {
          printValidated(\@in);
        }
      }
    }
    if (defined $Hstatus and ($status=~m/$Hstatus/)) {
      print $c[1]."    $ZT[11]  ".$c[4]."[$DS[13] $Hstatus] \n";
    }

    if (defined $notIn) {
      for my $noin(@notIns) {
        if ($html=~m/\b$noin\b/) {
          push @noins, $noin;
        }
      }
      if (scalar(grep { defined $_} @noins) eq 0) {
        print $c[1]."    $ZT[12] $c[4]\[$notIn]\n";
      }
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
      titleSCAN($html, $status) if $result && (defined $Hstatus || defined $validText || defined $notIn || defined $validShell);
      validateResult($URL1, $status, $html, $response, $result);
    }
    elsif ($reg) {
      getRegex($URL1, $html, $reg); }
    elsif ($data) {
      titleSCAN($html, $status); formData($URL1, $html, $status, $response); 
    }else{
      titleSCAN($html, $status);
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

## GET VALIDATION PARTS
sub getValidationParts {
  my ($html, $validType, $validRef)=@_;
  my @validationArray=@{ $validType };
  my $validation_number=0;
  (@exists, @notExists)=();
  for my $validPart(@validationArray) {
    if ($html=~m/\b$validPart\b/) {
      $validation_number++;
      if ($validRef eq 1) {
        push @exists, $validPart;
      }else{
        push @notExists, $validPart;
      }
    }
  }
  return $validation_number;
}

## CHECK VALIDATION SEARCH RESULTS / TARGETS LIST
sub checkValidation {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV=$URL1;
  if (defined $Hstatus) { if ($status ne $Hstatus) { $cV=""; } }
  if (defined $validText) {
    my $validation_number = getValidationParts($html, \@validTexts, "1");
    if (defined $all) {
      if (scalar(grep { defined $_} @validTexts) ne scalar(grep { defined $_} @exists)) { $cV=""; }
    }else{
      if ($validation_number <= 0) { $cV=""; }
    }
  }
  
  if (defined $notIn) {
    my $notin_number = getValidationParts($html, \@notIns, "2");
    if ($notin_number > 0) { $cV=""; }
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
  if (defined $validShell) { checkUloadedShell($URL1); }
  if (defined $zoneH) { zoneH($URL1, $zoneH); }
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

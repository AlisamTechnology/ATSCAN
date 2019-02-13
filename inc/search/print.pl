#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($limit, $get, $post, $Hstatus, $validText, $content, $beep, $output, $msource, $notIn, $expHost, $expIp, $command, $all,
     $data, $validShell, $zoneH, $fullHeaders, $ua, $geoloc, $geoServer, $V_IP, @c, @DT, @DS, @TT, @aTsearch, @aTscans, @data, @validTexts, @notIns, @exists,
     @notExists, @ZT, @validShells);

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
    print $c[3]."[$in]";
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
      print $c[1]."    $ZT[11]  ".$c[3]."[$DS[13] $Hstatus] \n";
    }
    if (defined $notIn) {
      for my $noin(@notIns) {
        if ($html=~m/\b$noin\b/) {
          push @noins, $noin;
        }
      }
      if (scalar(grep { defined $_} @noins) eq 0) {
        print $c[1]."    $ZT[12] $c[3]\[$notIn]\n";
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
      titleSCAN($html, $status) if $result && (defined $Hstatus || defined $validText || defined $notIn);
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
        if ($response->is_success) {
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
  my $cV=checkValidation($URL1, $status, $html, $response, $result);
  if ($cV) {
    doPrint($URL1, $result, $html);
  }else{
    my @noresult1=($Hstatus, $validText, $notIn);
    my @noresult2=($exploit, $expIp, $expHost, $replace, $noQuery);
    my ($i, $i1);
    for (@noresult1) { $i="1" if defined $_; }
    for (@noresult2) { $i1="1" if defined $_; }
    noResult() unless (($result && !$i) || ($result && $i1 && !$i));
  }
}

## PRINT POST DATA RESULTS
sub formData {
  my ($URL1, $html, $status, $response)=@_;
  my $o=OO();
  if ($o<$limit) {
    my @noresult3=($Hstatus, $validText, $notIn);
    my $i3;
    for (@noresult3) { $i3="1" if defined $_; }
    if ($i3) {
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
  my $cV="";
  if ($result) { $cV="1"; }
  if (defined $Hstatus) { if ($status eq $Hstatus) { $cV="1"; } }
  if (defined $validText) {
    my $validation_number = getValidationParts($html, \@validTexts, "1");
    if (defined $all) {
      if (scalar(grep { defined $_} @validTexts) eq scalar(grep { defined $_} @exists)) { $cV="1"; }
    }else{
      if ($validation_number > 0) { $cV="1"; }
    }
  }
  if (defined $notIn) {
    my $notin_number = getValidationParts($html, \@notIns, "2");
    if ($notin_number <= 0) { $cV="1"; }
  }
  return $cV;
}

## SHELL URL VALIDATION
sub validShell {
  my ($URL1, $validShell)=@_;
  my @eew;
  print $c[1]."    VSHELL $c[10] [$validShell]\n";
  print $c[1]."    SHELL   ";
  for my $vref(@validShells) {
    my $vref=replaceReferencies($URL1, $vref);
    my $reShell = $ua->get("$vref");
    if ($reShell->is_success and ($reShell->code eq "200")) {
      push @eew, $vref;
    }
  }
  if (scalar(@eew) < 1) {
    print $c[2]."No shell found!\n";
  }else{
    my $I=0;
    for my $eew(@eew){
      $I++;
      print $c[3]."$eew\n";
      if ($I>0 and $I<scalar(@eew)) {
        print "            ";
        saveme($eew, "");
      }
    }
  }
}

## PRINT RESULTS
sub doPrint {
  my ($URL1, $result, $html)=@_;
  my $o=OO();
  if ($o<$limit) {
    my @noresult1=($Hstatus, $validText, $notIn);
    my @noresult2=($exploit, $expIp, $expHost, $replace, $noQuery);
    my ($i, $i1);
    for (@noresult1) { $i="1" if defined $_; }
    for (@noresult2) { $i1="1" if defined $_; }    
    print $c[3]."$URL1\n" unless (($result && !$i) || ($result && $i1 && !$i));
    if (defined $beep || $beep) { print chr(7); }
    saveme($URL1, "");
    checkExtratScan($URL1, $html);
  }
}

## FULL REQUEST HEADERS
sub fullRequestHeaders {
  my $Hcopy="$Bin/inc/conf/user/HeadersTemp.txt";
  print $c[1]."    HEADERS ";
  print "-" x 65 ."\n";
  open (HC, $Hcopy);
  while (my $seH=<HC>) {
    chomp $seH;
    $seH=decode_entities($seH);
    $seH=uri_unescape($seH);
    print "$c[10]            $seH\n";
  }
  close(HC);
  unlink $Hcopy if -e $Hcopy;
}

## EXTRAT USER SCAN
sub checkExtratScan {
  my ($URL1, $html)=@_;
  if (defined $content) { points(); print $c[10]."$html\n"; }
  if (defined $msource) { printSource($URL1, $html); }
  if (defined $fullHeaders) { fullRequestHeaders(); }
  if (defined $command) { checkExternComnd($URL1, $command); }              
  if (defined $validShell) { validShell($URL1, $validShell); }
  if (defined $geoloc) { geoloc($URL1); }  
  if (defined $zoneH) { zoneH($URL1, $zoneH); }
}
 
sub geoloc {
  my $URL1=$_[0];
  print $c[1]."    GEOLOC  ";
  
  if ($URL1!~/$V_IP/) {
    my $ips=checkExtraInfo($URL1);
    if ($ips) { 
	  $URL1=inet_ntoa($ips);
	}
  }
  my $u="$geoServer/$URL1";
  ckeck_ext_founc("1");
  my $geoSearch=$ua->get($u);
  $geoSearch->as_string;
  my $geoRes=$geoSearch->content; 
  
  if ($geoRes=~/AS(\d)/) {
    print $c[1]."....................................................................\n";
	sleep 2;
    my @geodata=split(",\"", $geoRes);
    my @re=('\"', '\{', '\}', '\]');
    for my $geodata(@geodata) { 
      for (@re)	{ $geodata=~s/$_//g if defined $_; }
	  if ($geodata && $geodata!~/(\@|count:|error:|status:|myip:)/) {		
		my @zgh=split(":", $geodata);
		print "$c[10]            - $zgh[0]: ";
		if ($zgh[1]) {
		  print "$c[3]$zgh[1]\n";
		}else{
		  print "\n";
		}
		if (defined $output) { printFile("$output", " - $geodata"); }
	  }
	}
  }else{
    noResult();
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
    countResultLists() if !defined $geoloc;
    if (defined $output) { print $c[4]."[i] $DT[13] $output!\n"; }
  }else{ 
    negative();
  }
}

1;

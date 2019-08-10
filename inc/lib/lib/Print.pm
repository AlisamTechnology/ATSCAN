package Print;

use strict;
use warnings;
use FindBin '$Bin';
use URI::Escape;
use HTML::Entities;
use Exporter;
use Exploits;
use Subs;
use File::Basename;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(nargs print_Beg print_End print_sub_beg separator separaBlocks print_target print_valid_info 
                   print_errors print_redirect endscan print_agent exploits_alert advise_connect
				   @c print_geoloc noResult printFile print_zoneH count_targets print_scans print_title_scan
				   begenscan endscan colors bb cc dd nochmod extern_process);

###########################################################################################################
## SET COLORS
## Negro       0;30     Gris Obscuro  1;30
## Azul        0;34     Azul Claro    1;34
## Verde       0;32     Verde Claro   1;32
## Cyan        0;36     Cyan Claro    1;36
## Rojo        0;31     Rojo Claro    1;31
## Purpura     0;35     Fiuscha       1;35
## Café        0;33     Amarillo      1;33
## Gris Claro  0;37     Blanco        1;37

sub colors {
  my @c;
  my $col="\033[0;30m \033[1;30m \033[0;31m \033[0;32m \033[0;33m \033[1;33m \033[0;34m \033[0;35m \033[0;36m \033[1;36m \033[0;37m \033[1;37m \033[1;34m \033[1;31m \033[1;32m";
  if ($^O!~/Win/) { @c=split / /, $col; }
  else{ $col=" ," x 13; $col.=" "; @c=split /,/, $col; }
  return @c;
}

###########################################################################################################
my @c = colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @OTHERS = Exploits::OTHERS();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT = Exploits::TT();

###########################################################################################################
## DISCLEAMER
sub discleamer { print $c[10]."  $OTHERS[11] \n  $OTHERS[12]  \n  $OTHERS[13] \n"; }

###########################################################################################################
## BAD ARGS
sub bad {
  use Banner;
  Banner::banner();
  no_args();
}

#########################################################################################################################
## EXTERN COMMAND EXECUTION
sub checkExternComnd {
  my ($url, $commands)=@_;
  my $ic=0;
  for my $comnd(@{$commands}) {
    $ic++;
	$comnd = Subs::replaceReferencies($url, $comnd);
	print $c[1]." $DT[24]   $c[10] [".$ic."/".scalar(@{$commands})."] [$comnd]\n";
	$comnd = Subs::getComnd($url, $comnd);
	return $comnd;
  }
}

###########################################################################################################
## EXTERN COMMANDS
sub extern_process {
  my ($u, $popup, $comnd) = @_;
  if (defined $popup) {
    $comnd="sudo xterm -title '$u' -hold -e '$comnd'";
    print "$c[4]            [!] $c[10]Opening process in extern window..\n";
    sleep 2;
    print $c[8]."            ";
    system("$comnd & ");
  }else{
    print $c[8]."            ";
    system("$comnd");
  }
  print $c[1]. "." x 75 ."\n";
}

###########################################################################################################
## CHMOD 777
sub nochmod {
  my ($path, $action)=@_;
  sleep(1);
  print $c[2]."[!] Couldn't have write permitions: $path !\n";
  if ($action) { exit(); } 
}

###########################################################################################################
## NO ARGS PROVIDED
sub no_args {
  if (-e "/usr/bin/atscan") {
    print $c[11]."[!] $OTHERS[5]:$c[5] atscan$c[11] [$c[5]options$c[11]] or $c[5]atscan$c[11] [$c[5]--help$c[11]|$c[5]-h$c[11]|$c[5]-?$c[11]] or $c[5]atscan$c[11] [$c[5]--interactive$c[11]]\n";
  }else{
    print $c[5]."[!] $OTHERS[5]: perl ./",basename($0)," $TT[8] ./",basename($0)," $TT[9]\n";
  }
  exit();
}

###########################################################################################################
## SEPARATORS
sub separator {
  print $c[1]." ==============================================================================\n";
  print $c[1]." ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"; 
  print $c[1]." ==============================================================================\n"; 
}

## SEPARATOR
sub separaBlocks {
  print $c[1]."--------------------------------------------------------------------------------\n"; 
}
##
sub points {
  print $c[1]." ...............................................................................\n"; 
}

#########################################################################################################################
## FILE WRITE ERRORS
sub cc { sleep(1); print $c[3]."OK\n"; }
sub bb { sleep(1); print $c[4]."Failed!\n"; }
sub dd { sleep(1); print $c[4]."[!] $DT[8]\n"; }

###########################################################################################################
## PRINT INFO
sub print_info {
  my ($Target, $exploit, $expHost, $expIp, $parametro, $replace, $replaceFROM) = @_;
  print $c[5]."[::] TARGET     $c[10] [$Target]\n" if ($Target);
  print $c[5]."[::] EXPLOIT    $c[10] [$exploit]\n" if $exploit;
  print $c[5]."[::] EXP IP     $c[10] [$expIp]\n" if $expIp;
  print $c[5]."[::] EXP HOST   $c[10] [$expHost]\n" if $expHost;
  print $c[5]."[::] PARAMS     $c[10] [$parametro]\n" if $parametro;
  print $c[5]."[::] REPLACE    $c[10] [$replace]\n" if $replace;
  print $c[5]."[::] REPLACE    $c[10] [$replaceFROM]\n" if $replaceFROM; 
}

###########################################################################################################
sub print_valid_info {
  my ($Hstatus, $validText, $validTextAll, $exclude, $excludeAll, $validShell, $validServer) = @_; 
  print $c[5]."[::] CODE VAL   $c[10] [$Hstatus]\n" if $Hstatus;
  print $c[5]."[::] VALIDATE   $c[10] [$validText]\n" if $validText;
  print $c[5]."[::] ALL VALID  $c[10] [$validTextAll]\n" if $validTextAll;
  print $c[5]."[::] ALL EXCL   $c[10] [$excludeAll]\n" if $excludeAll;
  print $c[5]."[::] EXCLUDE    $c[10] [$exclude]\n" if $exclude;
  print $c[5]."[::] VA SHELL   $c[10] [$validShell]\n" if $validShell;
  print $c[5]."[::] VA SERVER  $c[10] [$validServer]\n" if $validServer;
}

###########################################################################################################
## PRINT INFO
sub print_info1 {
  my ($dork, $mlevel, $motor, $numotors, $mrandom, $ifinurl, $unique, $post, $get, $getlinks) = @_;
  print $c[5]."[::] DORK       $c[10] [$dork]\n" if $dork;
  print $c[5]."[::] LEVEL      $c[10] [$mlevel]\n" if $mlevel;
  print $c[5]."[::] ENGINES    $c[10] [$motor]\n" if $motor;
  print $c[5]."[::] ENGINES    $c[10] [Default: bing]\n" if (!$motor && $numotors eq 1);
  print $c[5]."[::] RAND ENG   $c[10] [$mrandom]\n" if $mrandom;
  print $c[5]."[::] IFINURL    $c[10] [$ifinurl]\n" if $ifinurl;
  print $c[5]."[::] UNIQUE     $c[10] [Yes]\n" if $unique;
  print $c[5]."[::] METHOD     $c[10] [POST]\n" if $post;
  print $c[5]."[::] METHOD     $c[10] [GET]\n" if $get;
  print $c[5]."[::] INDEX      $c[10] [Parser]\n" if $getlinks;
}

###########################################################################################################
## SERACH BAD CONNECTION ALERT
sub advise_connect {
  print $c[4]." [!] Failed to connect! try again\n";
}

###########################################################################################################
## WAIT
sub print_espera { print $c[4]."[!] $DT[31]\n\n"; }

###########################################################################################################
## TITLE SCAN
sub print_title_scan {
  my $ref = $_[0];
  my %refs = (
               '1'=>'SEARCH ENGINE', 
			   '2'=>'WORDPRESS SITES', 
			   '3'=>'JOOMLA SITES', 
			   '4'=>'XSS', 
			   '5'=>'LFI', 
			   '6'=>'JOOMLA RFI', 
			   '7'=>'WORDPRESS AFD', 
			   '8'=>'ADMIN PAGE', 
			   '9'=>'SUB DOMAINS', 
			   '10'=>'UPLOAD FILES', 
			   '11'=>'ZIP FILES',
			   '12'=>'E-MAILS',
			   '13'=>'MD5 ENCODE', 
			   '14'=>'BASE ENCODE 64', 
			   '15'=>'BASE DECODE 64', 
			   '16'=>'PORTS', 
			   '17'=>'SQLI'
			 );
			 
  for (keys %refs) {
    if ($_ eq $ref) {
	  print $c[11]."$refs{$_} ";
	}
  }
}

##########################################################################################################
## EXPLOITS ALERT
sub exploits_alert {
  print $c[4]."  [!] $DT[28]\n";
}

##########################################################################################################
##
sub begen {
  my $now = Subs::now();
  print $c[11]."[$now] [:::] STARTING ";
}
##
sub end {
  print $c[11]."SCAN ...\n";
  separaBlocks();
  sleep 2;
}

######################################################################################################################
## NO RESULTS FOUND
sub noResult { print $c[2]."$DT[1]\n"; }

###########################################################################################################
## END SCAN
sub endscan {
  my ($np, $limit, $ifend, $isscan, $output) = @_;
  if ($np > 0) {
    if ($limit ne 500) { 
      print $c[3]."[!] $DT[34] ($limit result\/s)!\n";
    }else{
      print $c[3]."[!] ".$np." $DT[4]\n";
    }
    if ($output) { print $c[3]."[!] Results saved in $output\n"; }
  }else{
    print $c[2]."[!] ".$np." $DT[4]\n";
  }
  my $now = Subs::now();
  print $c[4]."[$now] $c[10]$DT[3]\n";
  if (defined $ifend || $ifend) { print chr(7); }
}

###########################################################################################################
## PRINT URL
sub print_Beg {
  my ($url, $i, $ii, $isscan) = @_;
  points() if $ii;
  print $c[1]." URL      $c[10] [$i/$ii] $url\n" if $ii;
  sleep 1;
}

###########################################################################################################
## PRINT HTTP CODE AND SERVER NAME
sub print_sub_beg {
  my ($st, $sh) = @_;
  my $continue;
  if ($st ne 500) {
    $continue = 1;
    print $c[1]." STATUS   $c[10] $st\n";
	$sh = $sh ? $sh : 'Undefined';
    print $c[1]." SERVER   $c[10] $sh\n";
  }else{
    print $c[1]." ERROR    $c[2] Error! Code: $st\n";
  }
  return $continue;
}

#####################################################################################################################
## PRINT SCAN RESULT
sub print_End {
  my ($url, $st, $ht, $valido, $isscan, $regs, $output, $beep) = @_;
  if ($isscan) {
    print $c[1]." SCAN      ";
	if ($valido && $st eq 200) {
	  my @regs = @{$regs};
	  if (scalar @$regs > 0) {
	    print_End1($ht, \@regs, $output, $beep);
	  }else{
	    print $c[3]."$url\n";
		saveme($url, "", $output);
		if (defined $beep || $beep) { print chr(7); }
	  }
    }else{
	  print $c[2]."No result found!\n";
	}  
  }else {
    if ($output) {
	  saveme($url, "", $output);
	}
  }
}

#####################################################################################################################
## PRINT SCAN RESULT
sub print_End1 {
  my ($ht, $regs, $output, $beep) = @_;
  my $hssab=0;
  for my $reg(@{$regs}) {  
    while ($ht=~/$reg/g) {
      $hssab++;
      print " | " if $hssab > 1;
      print $c[3]."$1";
      saveme($1, "1", $output);
	  if (defined $beep || $beep) { print chr(7); }
	}
	print "\n";
  }
  print $c[2]."No result found!\n" if !$hssab;
}

#########################################################################################################################
## BUILT POSITIVE SCAN RESULTS LIST
sub saveme { 
  my ($URL1, $sep, $output)=@_;
  if (defined $output) { printFile("$output", " $URL1"); }
}

###########################################################################################################
## PRINT TARGET
sub print_target {
  my ($t, $count, $total, $ips) = @_;
  separator();
  print $c[1]." TARGET    [$count/$total]$c[6] $t\n";
  my $ip = $ips ? $ips : "Undefined";
  print $c[1]." IP       $c[10] $ip\n";
  sleep 1;
}

###########################################################################################################
## COUNT TARGETS
sub count_targets {
  my $list = $_[0];
  my $col = (scalar @{$list} > 0) ? $c[3] : $c[4];
  print $col."[!] ".scalar @{$list}." $DT[4]\n\n";
  exit if (scalar @{$list} < 1);
  sleep 1;
}

###########################################################################################################
## TITLE ERRORS
sub title_errors {
  print $c[1]." $ErrT[18]$c[4]   [!] $c[10]$ErrT[24]\n";
}

###########################################################################################################
## PRINT HTML ERRORS ALERT
sub print_errors { 
  my ($ErrT, $E)=@_; 
  print $c[1]."             $c[10] - $c[4]$ErrT ".$c[10]."[$E]"; 
  print "\n";
}

###########################################################################################################
## PRINT REDIRECT
sub print_redirect {
  my ($redirect_to) = $_[0];
  print $c[1]." $DS[1]      $c[4]$DT[36]", $redirect_to, "\n";
}

###########################################################################################################
## PRINT AGENT
sub print_agent {
  my $agent = $_[0];
  print $c[1]." $SCAN_TITLE[23]     $c[10]$agent\n";
}

###########################################################################################################
## PRINT HTML
sub print_content {
  my $html = $_[0];
  print "$c[1] CONTENT   $c[10] $html\n";
}

###########################################################################################################
## PRINT SOURCE CODE
sub printSource {
  my ($url, $html, $msource)=@_;
  $url = Subs::removeProtocol($url);
  $url =~ s/\//\-/g;
  my $fl="$msource/$url.html";
  open (FILE9, '>', "$fl");
  binmode(FILE9, ":utf8");
  print FILE9 "$html\n"; close(FILE9);
  print $c[1]."    Source $c[4] (".length($html)." bytes) Saved to $fl\n";
}

######################################################################################################################
## FULL REQUEST HEADERS
sub fullRequestHeaders {
  my $Hcopy="$Bin/inc/user/HeadersTemp.txt";
  print $c[1]." HEADERS    ";
  print "." x 65 ."\n";
  open (HC, $Hcopy);
  while (my $seH=<HC>) {
    chomp $seH;
    $seH = decode_entities($seH);
    $seH = uri_unescape($seH);
    print "$c[10]            $seH\n";
  }
  close(HC);
  unlink $Hcopy if -e $Hcopy;
}

######################################################################################################################
## PRINT TARGET GEOLOCALISATION
sub print_geoloc {
  my $html = $_[0];
  Print::print_general("1", " GEOLOC    ..........................................................");
  if ($html =~ /AS(\d)/) {
	sleep 2;
	my @geodata=split(",\"", $html);
	my @re=('\"', '\{', '\}', '\]');
	for my $geodata(@geodata) { 
      for (@re) { $geodata=~s/$_//g if defined $_; }
	  if ($geodata && $geodata!~/(\@|count:|error:|status:|myip:)/) {
	    my @zgh=split(":", $geodata);
		print "$c[10]            - $zgh[0]: ";
		if ($zgh[1]) {
		  print "$c[3]$zgh[1]\n";
		}else{
		  print "\n";
		}
      }
	}
  }else{
 	print "           $c[2]Server is down! "; 
	noResult();
  }
}

###########################################################################################################
## PRINT ZONE-H
sub print_zoneH {
  my $ht = $_[0];
  if ($ht =~ /color\=\"red\"\>(.*)<\/font\><\/li\>/) {
    my $znh = $1;
    if ($znh=~m/OK/) {
      print $c[1]." $ZT[25]    ".$c[3] . "$znh\n";
    }elsif ($znh=~m/ERROR/) {
      print $c[1]." $ZT[25]    ".$c[4] . "$znh\n";
    }
  }else{
	print $c[1]." $ZT[25]    ".$c[4] ."$ZT[23]\n";
  }
}

###########################################################################################################
## GENERAL PRINT 
sub print_general {
  my ($color, $toprint) = @_;
  print "$c[$color]$toprint\n";
}

##########################################################################################################
## PRINT FILES 
sub printFile {
  my ($File, $context)=@_;
  open (FILE, '>>', $File);
  binmode(FILE, ":utf8");
  print FILE "$context\n";
  close(FILE);
}

##########################################################################################################

1;

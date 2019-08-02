package Validate;

use strict;
use Socket;
use Subs;
use Getme;
use Target;
use Exploits;

## Copy@right Alisam Technology see License.txt

###########################################################################################################
## CONSTRUCTOR
sub new {
  my $self = {};
  $self->{ v_validate };
  $self->{ get_target_ip };
  bless $self, 'Validate';
  return $self;
}

###########################################################################################################
## VALIDATE BY SERVER
sub validServer {
  my ($validServer, $sh) = @_;
  my @validServer = Subs::buildArrays($validServer);
  my $i = 0;
  for (@validServer) {    
    if ($sh =~ /$_/) { $i++; }
  }  
  return $i;
}

###########################################################################################################
## VALIDATE A STRING
sub validText {
  my ($validText, $ht) = @_;
  my @validTexts = Subs::buildArrays($validText);
  my $i = 0;
  for (@validTexts) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

###########################################################################################################
## VALIDATE ALL STRING
sub validTextAll {
  my ($validTextAll, $ht) =@_;
  my @validTexts = Subs::buildArrays($validTextAll);
  my @all;
  for (@validTexts) {
    if ($ht =~ /$_/) {
	  push @all, $_;
	}
  }
  my $i;
  if (scalar @validTexts eq scalar @all) {
    $i++;
  }
  return $i;
}

###########################################################################################################
## EXCLUDE A STRING
sub exclude {
  my ($exclude, $ht) = @_;
  my @excludes = Subs::buildArrays($exclude);
  my $i = 0;
  for (@excludes) {
    if ($ht !~ /$_/) { $i++; }
  }
  return $i;
}

###########################################################################################################
## EXLUDE ALL STRING
sub excludeAll {
  my ($excludeAll, $ht) =@_;
  my @excludes = Subs::buildArrays($excludeAll);
  my @all;
  for (@excludes) {
    if ($ht !~ /$_/) {
	  push @all, $_;
	}
  }
  my $i;
  if (scalar @excludes eq scalar @all) {
    $i++;
  }
  return $i;
}

###########################################################################################################
## VALIDATE HTTP CODES
sub Hstatus {
  my ($Hstatus, $st) =@_;
  my @status = Subs::buildArrays($Hstatus);
  my $i = 0;
  for (@status) {
    if ($_ eq $st) { $i++; }
  }
  return $i;
}

###########################################################################################################
## EXTRAT INFO PROCESS SCAN
sub get_target_ip { 
  my ($self, $url) = @_;
  my $nip = new Target();
  $url = $nip->cleanURL($url);  
  my $ip = inet_aton($url);
  if ($ip) {
    my $ip = inet_ntoa($ip);
	$self->{ get_target_ip } = $ip if defined $url;
  } 
  return $self->{ get_target_ip };
}

###########################################################################################################
## VALIDATE HTTP CODES
sub validShell {
  my $validShell = $_[0];
  my $i = 0;
  my $getme = new Getme();
  my $hell = $getme->nav($_, $validShell, "", "");
  if ($hell->is_success) {
    $i++;
  }
  return $i;
}

###########################################################################################################
## VALIDATE XSS ERRORS
sub v_xss {
  my $ht = $_[0];
  my @xss = Exploits::V_XSS();
  my $i = 0;
  for (@xss) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

###########################################################################################################
## VALIDATE SQL ERRORS
sub v_sql {
  my $ht = $_[0];
  my @sql = Exploits::V_SQL();
  my $i = 0;
  for (@sql) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

###########################################################################################################
## VALIDATE LFI ERRORS
sub v_lfi {
  my $ht = $_[0];
  my @lfi = Exploits::V_LFI();
  my $i = 0;
  for (@lfi) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

###########################################################################################################
## VALIDATE WORDPRESS AFD ERRORS
sub v_wafd {
  my $ht = $_[0];
  my @wafd = Exploits::V_AFD();
  my $i = 0;
  for (@wafd) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

sub wps {
  my $ht = $_[0];
  my @V_WP = Exploits::V_WP();
  my $i = 0;
  for (@V_WP) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

sub jooms {
  my $ht = $_[0];
  my @V_JOOM = Exploits::V_JOOM();
  my $i = 0;
  for (@V_JOOM) {
    if ($ht =~ /$_/) { $i++; }
  }
  return $i;
}

sub v_validate {
  my ($self, $st, $ht, $sh, $xss, $sql, $lfi, $WpAfd, $Hstatus, $validText, $validTextAll, $exclude, $excludeAll, $validShell, $validServer, $WpSites, $JoomSites) = @_;
  my $validated;
  $validated = v_xss($ht) if defined $xss;
  $validated = v_sql($ht) if defined $sql;
  $validated = v_lfi($ht) if defined $lfi;
  $validated = wps($ht) if defined $WpSites;
  $validated = jooms($ht) if defined $JoomSites;
  $validated = v_wafd($ht) if defined $WpAfd;
  $validated = Hstatus($Hstatus, $st) if defined $Hstatus;
  $validated = validText($validText, $ht) if defined $validText;
  $validated = exclude($exclude, $ht) if defined $exclude;
  $validated = validTextAll($validTextAll, $ht) if defined $validTextAll;
  $validated = excludeAll($excludeAll, $ht) if defined $excludeAll;
  $validated = validShell($validShell) if defined $validShell;
  $validated = validServer($validServer, $sh) if defined $validServer;
  $self->{ v_validate } = $validated if $validated;
  return $self->{ v_validate };
}

###########################################################################################################

1;
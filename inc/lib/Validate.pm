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
  
  $self->{ validText };
  $self->{ validTextAll };
  $self->{ exclude };
  $self->{ excludeAll };
  $self->{ Hstatus };
  $self->{ validShell };
  $self->{ validServer };
  $self->{ get_target_ip };
  $self->{ v_xss };
  $self->{ v_wafd };
  $self->{ v_lfi };
  
  bless $self, 'Validate';
  return $self;
}

###########################################################################################################
## VALIDATE BY SERVER
sub validServer {
  my ($self, $validServer, $sh) = @_;
  my @validServer = Subs::buildArrays($validServer);
  my $i = 0;
  for (@validServer) {    
    if ($sh =~ /$_/) { $i++; }
  }  
  $self->{ validServer } = 1 if $i;
  return $self->{ validServer };
}

###########################################################################################################
## VALIDATE A STRING
sub validText {
  my ($self, $validText, $ht) = @_;
  my @validTexts = Subs::buildArrays($validText);
  my $i = 0;
  for (@validTexts) {
    if ($ht =~ /$_/) { $i++; }
  }
  $self->{ validText } = 1 if $i;
  return $self->{ validText };
}

###########################################################################################################
## VALIDATE ALL STRING
sub validTextAll {
  my ($self, $validTextAll, $ht) =@_;
  my @validTexts = Subs::buildArrays($validTextAll);
  my @all;
  for (@validTexts) {
    if ($ht =~ /$_/) {
	  push @all, $_;
	}
  }
  if (scalar @validTexts eq scalar @all) {
    $self->{ validTextAll } = 1 if defined $validTextAll;
  }
  return $self->{ validTextAll };
}

###########################################################################################################
## EXCLUDE A STRING
sub exclude {
  my ($self, $exclude, $ht) = @_;
  my @excludes = Subs::buildArrays($exclude);
  my $i = 0;
  for (@excludes) {
    if ($ht !~ /$_/) { $i++; }
  }
  $self->{ exclude } = 1 if $i;
  return $self->{ exclude };
}

###########################################################################################################
## EXLUDE ALL STRING
sub excludeAll {
  my ($self, $excludeAll, $ht) =@_;
  my @excludes = Subs::buildArrays($excludeAll);
  my @all;
  for (@excludes) {
    if ($ht !~ /$_/) {
	  push @all, $_;
	}
  }
  if (scalar @excludes eq scalar @all) {
    $self->{ excludeAll } = 1 if defined $excludeAll;
  }
  return $self->{ excludeAll };
}

###########################################################################################################
## VALIDATE HTTP CODES
sub Hstatus {
  my ($self, $Hstatus, $st) =@_;
  my @status = Subs::buildArrays($Hstatus);
  my $i = 0;
  for (@status) {
    if ($_ eq $st) { $i++; }
  }
  $self->{ Hstatus } = 1 if $i;
  return $self->{ Hstatus };
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
  my ($self, $validShell) = @_;
  my $getme = new Getme();
  my $hell = $getme->nav($_, $validShell, "", "");
  if ($hell->is_success) {
    $self->{ validShell } = 1 if defined $validShell;
  }
  return $self->{ validShell };
}

###########################################################################################################
## VALIDATE SQL ERRORS
sub v_xss {
  my ($self, $ht) = @_;
  my @xss = Exploits::V_XSS();
  my $i = 0;
  for (@xss) {
    if ($ht =~ /$_/) { $i++; }
  }
  $self->{ v_xss } = 1 if $i;
  return $self->{ v_xss };
}

###########################################################################################################
## VALIDATE LFI ERRORS
sub v_lfi {
  my ($self, $ht) = @_;
  my @lfi = Exploits::V_LFI();
  my $i = 0;
  for (@lfi) {
    if ($ht =~ /$_/) { $i++; }
  }
  $self->{ v_lfi } = 1 if $i;
  return $self->{ v_lfi };
}

###########################################################################################################
## VALIDATE WORDPRESS AFD ERRORS
sub v_wafd {
  my ($self, $ht) = @_;
  my @wafd = Exploits::V_AFD();
  my $i = 0;
  for (@wafd) {
    if ($ht =~ /$_/) { $i++; }
  }
  $self->{ v_wafd } = 1 if $i;
  return $self->{ v_wafd };
}

###########################################################################################################

1;
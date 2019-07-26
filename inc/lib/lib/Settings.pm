package Settings;

use strict;
use FindBin '$Bin';

## Copy@right Alisam Technology see License.txt

my $userSetting = "$Bin/inc/usr/userSetting";

###########################################################################################################
## CONSTRUCTOR
sub new {
  my $self = {};
  $self->{ checkSetting };
  $self->{ get_configuration };
  bless $self, 'Settings';
  return $self;
}

###########################################################################################################
###########################################################################################################
## CHECK USER SETTING
sub checkSetting {
  my ($self, $object) = @_;
  my ($l1, @ans);
  open(F2, $userSetting);
  while (my $l = <F2>) {
    chomp $l;
    if ($l =~ /$object\s(.*)/) {
      $l1 = $l;
      @ans = split(" ", $l);
      $l1 =~ s/$ans[0]\s//ig;
    }
  }
  close(F2);
  $self->{ checkSetting } = $l1 if $l1;
  return $self->{ checkSetting };
}

###########################################################################################################
## USER CONFIGUATION
sub get_configuration {
  my ($self, $act) = @_;
  my @configuration;
  if (-e $userSetting) {
    open(F1, $userSetting);
    while (my $set = <F1>) {
      if (!($set =~ /^$/)) {
        push @configuration, $set;
      }
    }
    close( F1 );
  }
  $self->{ get_configuration } = \@configuration if (scalar @configuration > 0);
  return $self->{ get_configuration };
}

###########################################################################################################

1;

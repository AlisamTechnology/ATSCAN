package Target;

use strict;
use Socket;
use Exploits;

## Copy@right Alisam Technology see License.txt

##########################################################################################################
## CONSTRUCTOR
sub new {
  my $self = {};

  $self->{ host };
  $self->{ noQuery };
  $self->{ replace };
  $self->{ replaceFROM };
  $self->{ cleanURL };
  $self->{ _build_me };
  $self->{ dataFields };

  bless $self, 'Target';
  return $self;
}

#########################################################################################################################
#########################################################################################################################
## BUILD DORK AND TARGET ARRAYS 
sub _build_me {
  my ($self, $ob)=@_;
  my @array;
  my $V_RANG = Exploits::V_RANG();
  if (($ob =~ /$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp=$1.".".$2.".".$3.".".$4;
      my $endIp=$5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      @ip=split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) { 
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) { 
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) { 
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) { 
              $ip[3]=0 if($l == $8);
              $newIp=join('.',$i,$j,$k,$l);
              push @array, $newIp;
            }
          }
	    }
      }
  }else{
	@array = Subs::buildArrays($ob); 
  }
  $self->{ _build_me } = \@array if (scalar @array > 0);
  return $self->{ _build_me };
}

#########################################################################################################################
## CLEAN URL
sub cleanURL {
  my ($self, $url) = @_;
  my %replace=( 'http://' => '', 'https://' => '', 'www\.' => '', 'ftp://' => '', 'ftps://' => '');
  $url=~s/$_/$replace{ $_}/g for keys %replace;
  $url=~s/\/.*//s;
  $self->{ cleanURL } = $url if defined $url;
  return $url;
}

#########################################################################################################################
## GET DATA FORM FIELDS
sub dataFields {
  my ($self, $data, $get) = @_;
  $data=~s/\s/\+/g;
  $data=~s/\+=>/\=>/g;
  $data=~s/\=>\+/\=>/g;
  if (defined $get) {
    $data=~s/\=>/\=/g;
    $data=~s/\,\+/\,/g;
    $data=~s/\,/\&/g;
  }else{
    $data=~s/\=>/\=>'/g;
    $data=~s/\,/\',/g;
    $data=~s/\+/ /g;
    $data.="'";
  }
  $self->{ dataFields } = $data if defined $data;
  return $self->{ dataFields };
}

##########################################################################################################
## GET HOST
sub host { 
  my ($self, $url) = @_;
  my $protocol = Subs::getTargetProtocol($url);
  $url = Subs::removeProtocol($url);
  $url =~ s/\/.*//s;
  $self->{host} = "$protocol//$url" if defined $url;
  return $self->{host};
}

##########################################################################################################
## REMOVE QUERY
sub noQuery { 
  my ($self, $url) = @_;
  my $protocol = Subs::getTargetProtocol($url);
  $url = Subs::removeProtocol($url);
  $url=~s/=.*/=/g;
  $url = "$protocol//$url";
  $self->{noQuery} = $url if defined $url;
  return $self->{noQuery};
}

########################################################################################################## 
## REPLACE
sub replace { 
  my ($self, $url, $replace) = @_;
  $replace=~s/\s\=\>/=>/g;
  $replace=~s/\=\>\s/=>/g;
  my @replaceParts=split("=>", $replace);
  $url=~s/\Q$replaceParts[0]/$replaceParts[1]/ig;
  $self->{replace} = $url if defined $replace;
  return $self->{replace};
}

##########################################################################################################
## PATCIAL REPLACE
sub replaceFROM { 
  my ($self, $url, $replaceFROM) = @_;
  $replaceFROM =~ s/\s\=\>/=>/g;
  $replaceFROM =~ s/\=\>\s/=>/g;
  my @replaceParts = split("=>", $replaceFROM);
  $url=~s/$replaceParts[0](.*)//s;
  $url=~s/$replaceParts[0]//ig;
  $url=$url.$replaceParts[1];
  $self->{replaceFROM} = $url if defined $replaceFROM;
  return $self->{replaceFROM};
}

##########################################################################################################

1;
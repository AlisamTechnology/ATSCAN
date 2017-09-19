#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## SET COLORS
## Negro       0;30     Gris Obscuro  1;30
## Azul        0;34     Azul Claro    1;34
## Verde       0;32     Verde Claro   1;32
## Cyan        0;36     Cyan Claro    1;36
## Rojo        0;31     Rojo Claro    1;31
## Purpura     0;35     Fiuscha       1;35
## Café        0;33     Amarillo      1;33
## Gris Claro  0;37     Blanco        1;37

my $col="\033[0;30m \033[1;30m \033[0;31m \033[0;32m \033[0;33m \033[1;33m \033[0;34m \033[0;35m \033[0;36m \033[1;36m \033[0;37m \033[1;37m \033[1;34m \033[1;31m \033[1;32m";
my @c;
if ($^O!~/Win/) { @c=split / /, $col; }
else{ $col=" ," x 13; $col.=" "; @c=split /,/, $col; }

sub get_colors { return @c; }

1;

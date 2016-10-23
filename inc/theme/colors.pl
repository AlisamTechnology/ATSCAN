#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## SET COLORS
my $col="\033[0;30m \033[1;30m \033[0;31m \033[0;32m \033[0;33m \033[1;33m \033[0;34m \033[0;35m \033[0;36m \033[1;36m \033[0;37m \033[1;37m \033[1;34m";
my @c;
if ($^O!~/Win/) { @c=split / /, $col; }
else{ $col=" ," x 12; $col.=" "; @c=split /,/, $col; }

sub get_colors { return @c; }

1;

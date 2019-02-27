#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

my @deteted_files=(
                   $Bin."/inc/theme/separators.pl",
                   $Bin."/inc/theme/colors.pl",
                   $Bin."/inc/index.pl",
                   $Bin."/inc/functions/ArgsList.pl"
				   );

for (@deteted_files) { unlink $_ if -e $_; }

1;
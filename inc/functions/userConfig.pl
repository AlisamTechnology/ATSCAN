#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Copy qw(copy);
## Copy@right Alisam Technology see License.txt

## USER CONFIGURATION SETTING
our (@c, $SetInteractive);
ClientConfiguration();

1;

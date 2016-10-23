#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## EXIT
our ($checkVersion, $help, $updtd, $uninstall, $toolInfo);
if (!defined $checkVersion && !defined $help && !defined $updtd && !defined $uninstall && !defined $toolInfo) { subfin(); logoff(); }

1;

#!/usr/bin/env gawk
# These variables are initialized on the command line (using '-v'):
# - value

BEGIN {
  FS = ","
}
{
  l = 1
  r = NF

  while (l <= r) {
    m = int((l + r) / 2)

    if ($m == value) {
      print m
      exit
    }

    if ($m < value) l = m + 1
    if ($m > value) r = m - 1 
  }

  print -1
}

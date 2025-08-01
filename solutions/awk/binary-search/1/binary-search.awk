#!/usr/bin/env gawk
# These variables are initialized on the command line (using '-v'):
# - value

{
  len = split($0, nums, ",")

  l = 1
  r = len

  while (l <= r) {
    m = int((l + r) / 2)

    if (nums[m] == value) {
      print m
      exit
    }

    if (nums[m] < value) l = m + 1
    if (nums[m] > value) r = m - 1 
  }

  print -1
}

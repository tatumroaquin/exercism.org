#!/usr/bin/env gawk

BEGIN {
  len = split(num, digits, "")

  for (i = 1; i <= len; i++) {
    res += digits[i]^len
  }

  print (num == res) ? "true" : "false"
}

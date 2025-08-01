#!/usr/bin/env gawk

BEGIN {
  len = length(num)

  for (i = 1; i <= len; i++) {
    res += substr(num, i, 1)^len
  }

  print (num == res) ? "true" : "false"
}

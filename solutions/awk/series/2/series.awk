#!/usr/bin/env gawk

{
  if ($0 == "") {
    print "series cannot be empty"
    exit 1
  }
  if (len <= 0) {
    print "invalid length"
    exit 1
  }
  if (len > length($1)) {
    print "invalid length"
    exit 1
  }

  offset = length($0) - len + 1
  series = $0

  for (i = 1; i <= offset; i++) {
    $i = substr(series, i, len)
  }

  print
}

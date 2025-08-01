BEGIN {
  # parse every char as separate column
  FS = ""
}

{
  # remove non-alphabet chars
  gsub(/[^[:alpha:]]/, "", $0)
  $0 = tolower($0)

  for(i = 1; i <= NF; i++) {

    # dict[char] = count, truthy if char is seen
    if (dict[$i]) {
      print "false"
      exit 0
    }

    dict[$i] += 1
  }

  print "true"
}

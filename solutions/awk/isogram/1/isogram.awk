{
  gsub(/[- ]/, "", $0)
  $0 = tolower($0)

  for(i = 1; i <= length($0); i++) {
    arr[i] = substr($0, i, 1)
  }

  len = asort(arr, sorted)

  for(i = 1; i < len; i++) {
    if (sorted[i] == sorted[i+1]) {
      print "false"
      exit 0
    }
  }

  print "true"
}

{
  year = $0

  if ((year % 100) == 0) {
    if (year % 400 == 0) {
      print "true"
      exit 0
    }
  } else {
    if (year % 4 == 0) {
      print "true"
      exit 0
    }
  }

  print "false"
}

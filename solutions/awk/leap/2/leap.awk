{
  year = $0

  if ((year % 100) == 0 && (year % 400) == 0) {
    print "true"
    exit 0
  }

  if ((year % 100) != 0 && (year % 4) == 0) {
    print "true"
    exit 0
  }

  print "false"
}

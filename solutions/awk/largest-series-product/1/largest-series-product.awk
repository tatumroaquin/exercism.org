{
  split($0, fields, ",")

  nums = fields[1]
  span = fields[2]

  if (match(nums, /[^[:digit:]]/)) {
    print "input must only contain digits"
    exit 1
  }

  if (span < 1) {
    print "span must not be negative"
    exit 1
  }

  if (length(nums) < span) {
    print "span must not exceed string length"
    exit 1
  }

  max = 0
  offset = span - 1

  for (i = 1; i <= length(nums)-offset; i++) {
    product = 1
    for (j = i; j <= i+offset; j++) {
      product *= substr(nums, j, 1)
    }

    if (product > max) max = product
  }

  print max
}

#!/usr/bin/env gawk

{
  $0 = toupper($0)
  score = 0
  word = "0" $0

  gsub(/[AEIOULNRST]/, "+1",  word)
  gsub(/[DG]/,         "+2",  word)
  gsub(/[BCMP]/,       "+3",  word)
  gsub(/[FHVWY]/,      "+4",  word)
  gsub(/[K]/,          "+5",  word)
  gsub(/[JX]/,         "+8",  word)
  gsub(/[QZ]/,         "+10", word)
}

function math(str, res, len) {
  len = split(str, nums, "+")
  sum = 0
  for (i = 1; i <= len; i++) {
    sum += nums[i]
  }
  return sum
}

END {
  printf("%s,%d", $0, math(word))
}

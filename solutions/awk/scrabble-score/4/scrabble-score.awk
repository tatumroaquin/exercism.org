#!/usr/bin/env gawk

BEGIN {
  FS = ""
}

{
  $0 = toupper($0)
  score = 0
  word = $0

  gsub(/[AEIOULNRST]/, "+1", word)
  gsub(/[DG]/,         "+2", word)
  gsub(/[BCMP]/,       "+3", word)
  gsub(/[FHVWY]/,      "+4", word)
  gsub(/[K]/,          "+5", word)
  gsub(/[JX]/,         "+8", word)
  gsub(/[QZ]/,         "+10", word)
}

END {
  score = sprintf(word)
  print $0 "," score
}

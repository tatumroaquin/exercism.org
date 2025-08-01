#!/usr/bin/env gawk

# G -> C (guanine -> cytocine)
# C -> G (cytocine -> guanine)
# T -> A (thymine -> adenine)
# A -> U (adenine -> uracil)

BEGIN {
  FS = ""
}

NF {
  if (match($0, /[^GCTA]/)) {
    print "Invalid nucleotide detected."
    exit 1
  }
  
  gsub("G", "1")
  gsub("C", "2")
  gsub("T", "3")
  gsub("A", "4")

  gsub("1", "C")
  gsub("2", "G")
  gsub("3", "A")
  gsub("4", "U")

  print
}

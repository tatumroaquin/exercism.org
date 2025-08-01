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
  gsub("C", "G")
  gsub("A", "U")
  gsub("T", "A")
  gsub("1", "C")

  print
}

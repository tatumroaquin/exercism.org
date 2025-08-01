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
  
  # awk strings are immutable, meaning concatenation loads a new var in memory each time.
  # rna = rna map[$i] from previous iteration only works with small to medium size inputs

  gsub("G", "1")
  gsub("C", "G")
  gsub("A", "U")
  gsub("T", "A")
  gsub("1", "C")

  print
}

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

  print | "tr GCTA CGAU"
}

#!/usr/bin/env gawk

# G -> C (guanine -> cytocine)
# C -> G (cytocine -> guanine)
# T -> A (thymine -> adenine)
# A -> U (adenine -> uracil)

BEGIN {
  FS = ""

  map["G"] = "C"
  map["C"] = "G"
  map["T"] = "A"
  map["A"] = "U"
}

NF {
  if (match($0, /[^GCTA]/)) {
    print "Invalid nucleotide detected."
    exit 1
  }

  rna = ""

  for (i = 1; i <= NF; i++) {
    rna = rna map[$i]
  }

  print rna
}

#!/usr/bin/env gawk -f

BEGIN {
    map["Methionine"]    = "AUG"
    map["Phenylalanine"] = "UUU UUC"
    map["Leucine"]       = "UUA UUG"
    map["Serine"]        = "UCU UCC UCA UCG"
    map["Tyrosine"]      = "UAU UAC"
    map["Cysteine"]      = "UGU UGC"
    map["Tryptophan"]    = "UGG"
    map["STOP"]          = "UAA UAG UGA"
}

{
    strand = $0

    $NF = ""

    if (strand && match(strand, /[^AGCU]/)) {
		die("Invalid codon")
    }

    for (i = 1; i <= length(strand); i+=3) {
        codon = substr(strand,i,3)
		if (length(codon) < 3) die("Invalid codon")
        if (map["STOP"] ~ codon) break
		count = 0
        for (amino in map) {
            if (map[amino] ~ codon) {
                $(NF++) = amino
				count++
            }
        }
		if (count == 0) die("Invalid codon")
    }

    if (NF > 1 && $NF == "") NF--
    print
}

function die(msg) {
	print msg
	exit 1
}

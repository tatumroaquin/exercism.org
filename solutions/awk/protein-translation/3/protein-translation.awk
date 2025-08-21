#!/usr/bin/env gawk -f

@include "join"

BEGIN {
	map["AUG"] = "Methionine"
	map["UUU"] = map["UUC"] = "Phenylalanine"
	map["UUA"] = map["UUG"] = "Leucine"
	map["UCU"] = map["UCC"] = map["UCA"] = map["UCG"] = "Serine"
	map["UAU"] = map["UAC"] = "Tyrosine"
	map["UGU"] = map["UGC"] = "Cysteine"
	map["UGG"] = "Tryptophan"
	map["UAA"] = map["UAG"] = map["UGA"] = "STOP"

	FPAT = ".{1,3}"
}

{
	for (i = 1; i <= NF; i++) {
		if (!($i in map)) die("Invalid codon")
		if (map[$i] ~ "STOP") break

		for (codon in map) {
			if ($i ~ codon)
				proteins[++p] = map[codon]
		}
	}

	print join(proteins, 1, p)
}

function die(msg) {
	print msg
	exit 1
}

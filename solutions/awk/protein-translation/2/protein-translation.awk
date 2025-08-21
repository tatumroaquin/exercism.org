#!/usr/bin/env gawk -f

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

$1 ~ /[^ACGU]/ { die("Invalid codon") }

{
	for (i = 1; i <= NF; i++) {
		if (!($i in map)) die("Invalid codon")
		if (map[$i] ~ "STOP") break
		for (codon in map) {
			if ($i ~ codon) res = res map[codon] " "
		}
	}

	print substr(res, 1, length(res)-1)
}

function die(msg) {
	print msg
	exit 1
}

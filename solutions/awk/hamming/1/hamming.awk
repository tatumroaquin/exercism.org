BEGIN {
	dna1 = ""
	dna2 = ""
	hamming = 0
}

NR == 1 {
	dna1 = $0
}

NR == 2 {
	dna2 = $0
}

END {

	if (length(dna1) != length(dna2)) {
		print "strands must be of equal length"
		exit 1
	}

	for (i = 1; i <= length(dna1); i++) {
		gene1 = substr(dna1, i, 1)
		gene2 = substr(dna2, i, 1)
		if (gene1 != gene2) hamming++
	}

	print hamming
}

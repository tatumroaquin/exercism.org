#!/usr/bin/env gawk -f

BEGIN {
	RS = "[[:space:]]*[.!?][[:space:]]+"
}

NR == 1 { print "The text is:" }
NR <= 3 {
	if (length($0) <= 50)
		print gensub(/[[:space:]]+$/,"",1,$0 RT)
	else
		print substr($0, 1, 50) "..."
}
NR == 4 { print "..." }

{
	# https://man.cx/gawk#heading8
	$0 = $0 RT
	words += NF
	for (word = 1; word <= NF; word++) {
		chars += length($word)
	}
}

END {
	sents = NR
	score = ARI(chars, words, sents)
	ages = ceil(score)+4 "-" ceil(score)+5

	print "Words:", words
	print "Sentences:", sents
	print "Characters:", chars
	printf "Score: %.2f\n", score

	if (score >= 14) ages = "18-22"

	printf "This text should be understood by %s year-olds.\n", ages
}

function ceil(num) {
	if (num % 1 >= 0.5)
		return int(num+1)
	return int(num)
}

function ARI(chars, words, sents, score) {
	score = 4.71 * chars / words + 0.5 * words / sents - 21.43
	return score
}

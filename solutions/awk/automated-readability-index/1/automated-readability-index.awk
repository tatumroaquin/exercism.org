#!/usr/bin/env gawk -f

BEGIN {
	RS = "[[:space:]]*[.!?][[:space:]]+"
}

NR == 1 { print "The text is:" }
NR <= 3 {
	if (length($0) <= 50)
		print $0 "."
	else
		print substr($0, 1, 50) "..."
}
NR == 4 { print "..." }

{
	$0 = $0 "."
	sents++
	for (w = 1; w <= NF; w++) {
		words++
		word = $w
		chars += gsub(/[^[:space:]]/,"",word)
	}
}

END {
	print "Words:", words
	print "Sentences:", sents
	print "Characters:", chars
	score = ARI(chars, words, sents)
	printf "Score: %.2f\n", score
	if (score <= 13) {
		printf "This text should be understood by %d-%d year-olds.\n", \
			   ceil(score)+4, ceil(score)+5
	} else {
		print "This text should be understood by 18-22 year-olds."
	}
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

#!/usr/bin/env gawk

BEGIN { 
	FS = OFS = ""
}

{

	if ($0 ~ /[[:alpha:]]/) {
		print "letters not permitted"
		exit 1
	}

	if ($0 ~ /[@:!]/) {
		print "punctuations not permitted"
		exit 1
	}

	gsub(/[^0-9]/, "")

	if (NF < 10) {
		print "must not be fewer than 10 digits"
		exit 1
	}

	if (NF > 11) {
		print "must not be greater than 11 digits"
		exit 1
	}

	if (NF == 11 && $1 != 1) {
		print "11 digits must start with 1"
		exit 1
	}

	if (NF == 11 && $1 == 1) { 
		for (i = 1; i <= NF; i++) {
			$i = $(i+1)
		}
	}

	if ($1 == 0) { 
		print "area code cannot start with zero"
		exit 1
	}

	if ($1 == 1) { 
		print "area code cannot start with one"
		exit 1
	}

	if ($4 == 0) {
		print "exchange code cannot start with zero"
		exit 1
	}

	if ($4 == 1) {
		print "exchange code cannot start with one"
		exit 1
	}

	print
}

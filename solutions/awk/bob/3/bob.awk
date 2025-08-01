#!/usr/bin/env gawk

BEGIN {
	RS = "^$" # record separator
}

{
	question = /\?[[:space:]]*$/
	shouting = /[[:upper:]]/ && !/[[:lower:]]/
	silence = /^[[:space:]]*$/
}

shouting && question {
	print "Calm down, I know what I'm doing!"
	next
}

question {
	print "Sure."
	next
}

shouting {
	print "Whoa, chill out!"
	next
}

silence {
	print "Fine. Be that way!"
	next
}

{
	print "Whatever."
	next
}

END {
	if (NR == 0) {
		print "Fine. Be that way!"
	}
}

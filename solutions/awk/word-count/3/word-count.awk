#!/usr/bin/env gawk -f

BEGIN {
	FPAT = "[[:alnum:]]+('[[:alnum:]]+)?"
}

{
	$0 = tolower($0)
	for (i = 1; i <= NF; i++) words[$i]++
}

END {
	for (w in words) print w ":", words[w]
}

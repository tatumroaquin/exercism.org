BEGIN {
	FS = "T"
	giga = 10^9
}

NF == 1 {
	date = gensub(/[-]/, " ", "g", $1)
	hour = "00 00 00"
	secs = mktime(date " " hour, 1)
	secs = secs + giga
	print strftime("%Y-%m-%dT%T", secs, 1)
}

NF == 2 {
	date = gensub(/[-]/, " ", "g", $1)
	hour = gensub(/[:]/, " ", "g", $2)
	secs = mktime(date " " hour, 1)
	secs = secs + giga
	print strftime("%Y-%m-%dT%T", secs, 1)
}

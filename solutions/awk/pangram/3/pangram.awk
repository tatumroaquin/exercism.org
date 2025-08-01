{
	if ($0 == "") {
		print "false"
		exit
	}

	text = tolower($0)
	gsub(/[^[:alpha:]]/, "", text)

	for (i = 1; i <= length(text); i++) {
		seen[substr(text, i, 1)] = 1
	}

	count = 0
	for (char in seen) {
		count += 1
	}

	print (count == 26) ? "true" : "false"
}

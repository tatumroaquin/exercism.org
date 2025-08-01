{
	sentence = $0

	if (sentence == "") {
		print "false"
		exit
	}

	# clean up input string delete non-alpha
	gsub(/[^[:alpha:]]/, "", $sentence)
	$sentence = tolower($sentence)

	# build a dictionary of letters init to 0
	for(i = 97; i < 123; i++) {
		c = sprintf("%c", i)
		dict[c] = 0
	}

	# check each letter increment 1 in dict
	len_letters = split($sentence, letters, "")
	for (i = 1; i <= len_letters; i++) {
		dict[letters[i]] += 1
	}

	# loop through dict check for zeros
	for (i = 97; i < 123; i++) {
		c = sprintf("%c", i)
		if (dict[c] == 0) {
			print "false"
			exit
		}
	}

	print "true"
}

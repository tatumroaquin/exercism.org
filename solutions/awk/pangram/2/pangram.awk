function ord(c, i) {
	for (i = 0; i < 256; i++) {
		t[sprintf("%c",i)] = i
	}
	return t[c]
}

function chr(d) {
	return sprintf("%c", d)
}

{
	sentence = $0

	if ($sentence == "") {
		print "false"
		exit
	}

	for (i = ord("a"); i <= ord("z"); i++) {
		dict[chr(i)] = 0
	}

	gsub(/[^[:alpha:]]/, "", $sentence)
	$sentence = tolower($sentence)

	len_chars = split($sentence, chars, "")
	for (i = 1; i <= len_chars; i++) {
		dict[chars[i]] += 1
	}

	for (i = ord("a"); i <= ord("z"); i++) {
		if (dict[chr(i)] == 0) {
			print "false"
			exit
		}
	}

	print "true"
}

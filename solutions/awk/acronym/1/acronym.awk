{
	acronym = ""
	for (i = 1; i <= NF; i++) {
		n = split($i, words, /[-_]/)
		for (j = 1; j <= n; j++) {
			acronym = acronym substr(words[j], 1, 1)
		}
	}
	print toupper(acronym)
}
{
    gsub(/[-_]/, " ", $0)
	acronym = ""
	for (i = 1; i <= NF; i++) {
		acronym = acronym substr($i, 1, 1)
	}
	print toupper(acronym)
}
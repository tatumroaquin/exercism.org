# ETL = Extract, Transform, Load

BEGIN {
	len_abc = split("a b c d e f g h i j k l m n o p q r s t u v w x y z", letters)
}

NF >= 1 {
	gsub(/[:",]/, " ", $0)
	len_fields = split($0, fields)

	score =	fields[1]
	for (i = 2; i <= len_fields; i++) {
		letter = tolower(fields[i])
		dict[letter] = score
	}
}

END {
	for (i = 1; i <= len_abc; i++) {
		if (dict[letters[i]] == 0)
			continue

		letter = letters[i]
		score = dict[letters[i]]
		print letter "," score
	}
}


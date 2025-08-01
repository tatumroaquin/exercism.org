# ETL = Extract, Transform, Load

BEGIN {
	len_abc = split("a b c d e f g h i j k l m n o p q r s t u v w x y z", alphabet)
	for (i = 1; i <= len_abc; i++) {
		dict[alphabet[i]] = 0
	}
}

NF >= 1 {
	gsub(/[:",]/, " ", $0)
	len_parts = split($0, parts)

	value =	parts[1]
	for (i = 2; i <= len_parts; i++) {
		letter = tolower(parts[i])
		dict[letter] = value
	}
}

END {
	for (i = 1; i <= len_abc; i++) {
		if (dict[alphabet[i]] == 0)
			continue

		letter = alphabet[i]
		value = dict[alphabet[i]]
		print letter "," value
	}
}

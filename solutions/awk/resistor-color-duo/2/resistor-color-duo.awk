BEGIN {
	len = split("black brown red orange yellow green blue violet grey white", colors)

	for (i = 1; i <= len; i++) {
		dict[colors[i]] = i-1
	}
}
NF {
	value1 = $1 in dict ? dict[$1] : -1
	value2 = $2 in dict ? dict[$2] : -1

	if (value1 < 0 || value2 < 0) {
		print "invalid color"
		exit 1
	}

	resistance = value1 * 10 + value2
	print resistance
}

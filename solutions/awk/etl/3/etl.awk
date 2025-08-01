# ETL = Extract, Transform, Load

{
	# Extract score from the line
	if (match($0, /^([0-9]+)/, m)) {
		score = m[1]
	} else {
		next
	}
	
	# Extract letters using regex
	while (match($0, /([A-Za-z])/, m)) {
		letter = tolower(m[1])
		# Load the letter with the score
		dict[letter] = score
		# Transform input to remove the first match
		$0 = substr($0, RSTART + RLENGTH)
	}
}

END {
	# Sort the dictionary keys
	len_sorted = asorti(dict, sorted)

	# Print out the keys in order with the scores
	for (i = 1; i <= len_sorted; i++) {
		print sorted[i] "," dict[sorted[i]]
	}
}

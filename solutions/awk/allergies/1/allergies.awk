BEGIN {
	len_items = split("eggs peanuts shellfish strawberries tomatoes chocolate pollen cats", items)
	for (i = 1; i <= len_items; i++) {
		allergens[items[i]] = 2^(i - 1)
	}
}

{
	split($0, parts, ",")
	score = parts[1] % 256
	mode = parts[2]
	item = parts[3]

	if (mode == "allergic_to") {
		print and(score, allergens[item]) ? "true" : "false"
		exit
	}

	if (mode == "list") {
		allergies = ""
		for (i = 1; i <= len_items; i++) {
			item = items[i]
			if (and(score, allergens[item]))
				allergies = allergies items[i] ","
		}
	}
	print substr(allergies, 1, length(allergies) - 1)
}

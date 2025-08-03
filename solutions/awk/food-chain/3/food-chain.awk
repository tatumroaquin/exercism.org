#!/usr/bin/env gawk

function get_verse(num, animal, i) {
	animal = animals[num]

	printf first, animal

	if (animal != "fly") print map[animal]
	if (animal == "horse") return

	for (i = num; i > 1; i--) {
		pred = animals[i]
		prey = animals[i-1]
		printf hunt, pred, prey, \
		(i == 3) ? " that wriggled and jiggled and tickled inside her." : "."
	}

	print map["fly"]
}

BEGIN {
	split("fly spider bird cat dog goat cow horse", animals)

	first = "I know an old lady who swallowed a %s.\n"
	hunt = "She swallowed the %s to catch the %s%s\n"

	map["fly"] = "I don't know why she swallowed the fly. Perhaps she'll die."
	map["spider"] = "It wriggled and jiggled and tickled inside her."
	map["bird"] = "How absurd to swallow a bird!"
	map["cat"] = "Imagine that, to swallow a cat!"
	map["dog"] = "What a hog, to swallow a dog!"
	map["goat"] = "Just opened her throat and swallowed a goat!"
	map["cow"] = "I don't know how she swallowed a cow!"
	map["horse"] = "She's dead, of course!"

	for (i = start; i <= end; i++) {
		printf "%s", sep
		get_verse(i)
		sep = "\n"
	}
}

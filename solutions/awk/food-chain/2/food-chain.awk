#!/usr/bin/env gawk

# Variables declared on the command line
#       start
#       end

function get_verse(num, anim, map, j, spider) {
	verse = sprintf("I know an old lady who swallowed a %s.\n", anim[num])
	verse = verse map[anim[num]] "\n"

	for (j = num; j > 1 && num != 8; j--) {
		if (j == 3) {
			spider = " that " substr(map["spider"], 4, length(map["spider"]))
			verse = verse sprintf("She swallowed the %s to catch the %s%s\n", anim[j], anim[j-1], spider)
			continue
		}
		verse = verse sprintf("She swallowed the %s to catch the %s.\n", anim[j], anim[j-1])
	}

	if (1 < num && num < 8)
		verse = verse map["fly"] "\n"
	
	return verse
}

BEGIN {
	split("fly spider bird cat dog goat cow horse", anim)

	map["fly"] = "I don't know why she swallowed the fly. Perhaps she'll die."
	map["spider"] = "It wriggled and jiggled and tickled inside her."
	map["bird"] = "How absurd to swallow a bird!"
	map["cat"] = "Imagine that, to swallow a cat!"
	map["dog"] = "What a hog, to swallow a dog!"
	map["goat"] = "Just opened her throat and swallowed a goat!"
	map["cow"] = "I don't know how she swallowed a cow!"
	map["horse"] = "She's dead, of course!"

	for (i = start; i <= end; i++) {
		printf(get_verse(i, anim, map))
		if (i < end) printf "\n"
	}
}

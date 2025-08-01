BEGIN {
	if (start < 1 || end > 12 || start > end) {
		print "invalid"
		exit 1
	}

	pairs[1, 1]		= "house";														pairs[1, 2]		= "Jack built."
	pairs[2, 1]		= "malt";															pairs[2, 2]		= "lay in"
	pairs[3, 1]		= "rat";															pairs[3, 2]		= "ate"
	pairs[4, 1]		= "cat";															pairs[4, 2]		= "killed"
	pairs[5, 1]		= "dog";															pairs[5, 2]		= "worried"
	pairs[6, 1]		= "cow with the crumpled horn";				pairs[6, 2]		= "tossed"
	pairs[7, 1]		= "maiden all forlorn";								pairs[7, 2]		= "milked"
	pairs[8, 1]		= "man all tattered and torn";				pairs[8, 2]		= "kissed"
	pairs[9, 1]		= "priest all shaven and shorn";			pairs[9, 2]		= "married"
	pairs[10, 1]	= "rooster that crowed in the morn";	pairs[10, 2]	= "woke"
	pairs[11, 1]	= "farmer sowing his corn";						pairs[11, 2]	= "kept"
	pairs[12, 1]	= "horse and the hound and the horn";	pairs[12, 2]	= "belonged to"

	for (i = start; i <= end; i++) {
		verse = "This is"
		for (j = i; j >= 1; j--) {
			verse = verse " the " pairs[j, 1] " that " pairs[j, 2]
		}
		print verse
	}
}

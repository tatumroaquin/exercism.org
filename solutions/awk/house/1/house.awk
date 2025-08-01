BEGIN {
	if (start < 1 || end > 12 || start > end) {
		print "invalid"
		exit 1
	}

	lines[1] = "house that Jack built."
	lines[2] = "malt"
	lines[3] = "rat"
	lines[4] = "cat"
	lines[5] = "dog"
	lines[6] = "cow with the crumpled horn"
	lines[7] = "maiden all forlorn"
	lines[8] = "man all tattered and torn"
	lines[9] = "priest all shaven and shorn"
	lines[10] = "rooster that crowed in the morn"
	lines[11] = "farmer sowing his corn"
	lines[12] = "horse and the hound and the horn"

	verbs[2] = "lay in"
	verbs[3] = "ate"
	verbs[4] = "killed"
	verbs[5] = "worried"
	verbs[6] = "tossed"
	verbs[7] = "milked"
	verbs[8] = "kissed"
	verbs[9] = "married"
	verbs[10] = "woke"
	verbs[11] = "kept"
	verbs[12] = "belonged to"

	for (i = start; i <= end; i++) {
		verse = "This is the " lines[i]
		for (j = i; j > 1; j--) {
			 verse = verse " that " verbs[j] " the " lines[j-1]
		}
		print verse
	}
}

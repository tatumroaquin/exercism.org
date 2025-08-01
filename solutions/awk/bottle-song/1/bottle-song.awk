# These variables are initialized on the command line (using '-v'):
# - startBottles
# - takeDown

function pluralize(count, noun) {
	return count == 1 ? noun : noun "s"
}

function capitalize(word) {
	word = toupper(substr(word,1,1)) substr(word,2,length(word))
	return word
}

function get_verse(count, labels) {
	printf ("%s green %s hanging on the wall,\n", capitalize(labels[count]), pluralize(count, "bottle"))
	printf ("%s green %s hanging on the wall,\n", capitalize(labels[count]), pluralize(count, "bottle"))
	printf ("And if one green bottle should accidentally fall,\n")
	printf ("There'll be %s green %s hanging on the wall.\n", labels[count-1], pluralize(count-1, "bottle"))
}

BEGIN {
	split("one two three four five six seven eight nine ten", labels)
	labels[0] = "no"
	for (i = takeDown; i > 0; i--) {
		get_verse(startBottles, labels)
		if (i != 1) printf("\n")
		startBottles -= 1
	}
}

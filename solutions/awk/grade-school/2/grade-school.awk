#!/usr/bin/env gawk
# These variables are initialized on the command line (using '-v'):
# - action
# - grade

BEGIN {
	FS = ","
}

{
	if (match(seen, $1)) next

	roster[$2] = roster[$2] sep $1
	seen = seen $1
	sep = " "
}

END {
	sep = ""
	for (g in roster) {
		if (grade && g != grade) continue
		split(roster[g], names, " ")
		asort(names, sorted)
		for (i = 1; i <= length(sorted); i++) {
			printf sep sorted[i]
			sep = ","
		}
	}
}

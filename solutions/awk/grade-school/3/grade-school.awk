#!/usr/bin/env gawk

# These variables are initialized on the command line (using '-v'):
# - action
# - grade

BEGIN {
	FS = ","
}

{
	_student = $1
	_grade = $2

	if (seen[_student]++) next

	roster[_grade] = roster[_grade] sep $1
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

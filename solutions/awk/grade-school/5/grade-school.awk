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

	if (roster[_student]) next

	roster[_student] = _grade
}

END {
	# sort by value instead of indices
	# if value is equal, sort alphabetically
	PROCINFO["sorted_in"] = "@val_num_asc"
	for (name in roster) {
		if (grade && grade != roster[name]) continue

		printf sep name
		sep = ","
	}
}

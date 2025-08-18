#!/usr/bin/env gawk

{
	cnt = $0
	row[1] = 1

	while (cnt--) {
		print_row(row)
		for (c = length(row)+1; c > 1; c--) {
			row[c] = row[c] + row[c-1]
		}
	}

	delete row
}

function print_row(chunk, idx, res) {
	res = ""
	for (idx in chunk) {
		res = res chunk[idx] " "
	}
	print substr(res, 1, length(res) - 1)
}

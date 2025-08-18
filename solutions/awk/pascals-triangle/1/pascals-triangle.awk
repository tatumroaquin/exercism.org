#!/usr/bin/env gawk

BEGIN { FS = " " }

{
	arr[1][1] = 0
	arr[1][2] = 1
	arr[1][3] = 0

	for (r = 1; r <= $1; r++) {
		arr[r+1][1] = 0 # put zero first column
		for (c = 1; c < length(arr[r]); c++) {
			# populate next row of numbers
			arr[r+1][c+1] = arr[r][c] + arr[r][c+1]
		}
		arr[r+1][c+1] = 0 # put zero last column
	}

	for (r = 1; r < length(arr); r++) {
		for (c = 2; c < length(arr[r]); c++) {
			$(c-1) = arr[r][c]
		}
		print
	}
}

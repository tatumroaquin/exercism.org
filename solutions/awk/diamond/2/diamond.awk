#!/usr/bin/env -S gawk -f

@load "ordchr"

BEGIN {
	OFS = ""
}

{
	size = ord($1) - ord("A") + 1
	diamond(size, "A")
}

function diamond(size, char, rows, cols, L, R, dir) {
	NF = size * 2 - 1

	L = R = int(NF / 2 + 0.5)

	dir = 1

	for (i = 1; i <= NF; i++) {
		for (j = 1; j <= NF; j++) {
			if (L == j || j == R)
				$j = char
			else
				$j = " "
		}

		print

		if (L == 1) dir = -1

		L = L - dir
		R = R + dir

		char = chr(ord(char) + dir)
	}
}

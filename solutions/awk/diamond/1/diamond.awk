#!/usr/bin/env -S gawk -f

@load "ordchr"

{
	size = ord($1) - ord("A") + 1
	diamond(size, "A")
}

function diamond(size, char, rows, cols, L, R, dir) {
	rows = cols = size * 2 - 1

	L = R = int(cols / 2 + 0.5)

	dir = 1

	for (i = 1; i <= rows; i++) {
		for (j = 1; j <= cols; j++) {
			if (L == j || j == R)
				printf char
			else
				printf " "
		}

		printf "\n"

		if (L == 1) dir = -1

		L = L - dir
		R = R + dir

		char = chr(ord(char) + dir)
	}
}

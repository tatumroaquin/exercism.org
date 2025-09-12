#!/usr/bin/env -S gawk -f

BEGIN {
    FS = OFS = ""
}

{
    for (col = NF; col; col--) {
        grid[NR][col] = $col
    }
}

END {
    for (i = 0; i < NR*NF; i++) {
        row = int(i / NF) + 1
        col = i % NF + 1

		if (grid[row][col] == "*")
			mark_neighbours(grid,row,col)
    }

	print_grid(grid)
}

function mark_neighbours(grid,row,col,i,dy,dx) {
	grid[row][col] += 99

	for (i = 0; i < 9; i++) {
		dy = row + int(i / 3) - 1
		dx = col + i % 3 - 1

		if (grid[dy][dx] != "*")
			grid[dy][dx] += 1
	}
}

function print_grid(grid,row,col,i) {
	for (i = 0; i < NR*NF; i++) {
		row = int(i / NF) + 1
		col = i % NF + 1

		if (grid[row][col] >= 99)
			printf "*"
		else
			printf grid[row][col]

		if ((i + 1) % NF == 0) printf "\n"
	}
}

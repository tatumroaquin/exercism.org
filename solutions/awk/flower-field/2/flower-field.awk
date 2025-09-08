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
    # iterate thru flattened 2D array with stride
    for (i = 0; i < NR*NF; i++) {
        row = int(i / NF) + 1
        col = i % NF + 1
        $col = neighbours(grid,row,col)
        if ((i + 1) % NF == 0) print
    }
}

function neighbours(grid,row,col,count,i) {
    if (grid[row][col] == "*") return "*"

    for (i = 0; i < 9; i++) {
        dy = row + int(i / 3) - 1
        dx = col + i % 3 - 1
        count += grid[dy][dx] == "*"
    }

    return count ? count : "."
}

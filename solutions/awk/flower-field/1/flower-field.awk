#!/usr/bin/env -S gawk -f

BEGIN {
    FS = OFS = ""
    dirs[1] = "-1,-1"; dirs[5] = "1,0"
    dirs[2] = "0,-1";  dirs[6] = "-1,1"
    dirs[3] = "1,-1";  dirs[7] = "0,1"
    dirs[4] = "-1,0";  dirs[8] = "1,1"
}

{
    r++
    for (c = 1; c <= NF; c++) {
        grid[r][c] = $c
    }
}

END {
    rows = NR
    cols = NF
    update_grid(grid,rows,cols)
    print_grid(grid,rows,cols)
}

function update_grid(grid,rows,cols) {
    for (r = 1; r <= rows; r++) {
        for (c = 1; c <= cols; c++) {
            if (grid[r][c] == "*") continue

            count = 0
            for (d in dirs) {
                split(dirs[d], dir, ",")
                rr = r + dir[1]
                cc = c + dir[2]
                if (grid[rr][cc] == "*") count++
            }

            grid[r][c] = count ? count : grid[r][c]
        }
    }
}

function print_grid(grid,rows,cols) {
    for (r = 1; r <= rows; r++) {
        for (c = 1; c <= cols; c++) {
            $c = grid[r][c]
        }
        print
    }
}

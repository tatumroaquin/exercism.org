#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - x
# - y
# - dir

BEGIN {
	split("north east south west", turns)

	dirs["north"] = "0 1"
	dirs["east"] = "1 0"
	dirs["west"] = "-1 0"
	dirs["south"] = "0 -1"

	robot["x"] = x != "" ? x : 0
	robot["y"] = y != "" ? y : 0
	robot["d"] = dir ? dir : "north"

}

{
	if (!(robot["d"] in dirs)) exit 1
	if ($0 && $0 !~ /[ LAR]/) exit 1

	for (d = 1; d <= NF; d++) {
		if ($d ~ /[LR]/) turn($d)
		if ($d == "A") move()
	}
}

END {
	if (!(robot["d"] in dirs)) die("invalid direction")
	if ($0 && $0 !~ /[ LAR]/) die("invalid instruction")
	print robot["x"], robot["y"], robot["d"]
}

function turn(t, i) {
	for (idx in turns)
		if (robot["d"] == turns[idx])
			l = idx

	if (t == "R") ++l
	if (t == "L") --l
	if (l < 1) l = 4
	if (l > 4) l = 1

	robot["d"] = turns[l]
}

function move() {
	split(dirs[robot["d"]], vel)
	robot["x"] += vel[1]
	robot["y"] += vel[2]
}

function die(msg) {
	print msg > "/dev/stderr"
	exit 1
}

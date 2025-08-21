#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - x
# - y
# - dir

BEGIN {
	split("north east south west", turns)

	dirs["north"] = "0 1"
	dirs["east"]  = "1 0"
	dirs["west"]  = "-1 0"
	dirs["south"] = "0 -1"

	x = x != "" ? x : 0
	y = y != "" ? y : 0
	dir = dir ? dir : "north"

	if(!(dir in dirs)) die("invalid direction")
}

$1 ~ /[LR]/ { turn($1); next }
$1 == "A" { move(); next }
{ die("invalid instruction") }

END {
	if (status) exit status

	print x, y, dir
}

function turn(t) {
	for (idx in turns)
		if (dir == turns[idx])
			l = idx

	if (t == "R") ++l
	if (t == "L") --l
	if (l < 1) l = 4
	if (l > 4) l = 1

	dir = turns[l]
}

function move(vel) {
	split(dirs[dir], vel)
	x += vel[1]
	y += vel[2]
}

function die(msg) {
	print msg > "/dev/stderr"
	status = 1
	exit 1
}

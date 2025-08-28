#!/usr/bin/env gawk -f

@include "join"

# These variables are initialized on the command line (using '-v'):
# - ibase
# - obase

ibase < 2 { die("invalid ibase", 1) }
obase < 2 { die("invalid obase", 1) }
NF == 0	  { die("", 0) }

{
	for (i = NF; i > 0; i--) {
		if (ibase <= $i || $i < 0) {
			die("invalid digit", 1)
		}
		dec += $i * (ibase ^(NF-i))
	}
}

END {
	if (status != "") exit status

	while (dec != 0) {
		res = (dec % obase) " " res
		dec = int(dec / obase)
	}

	if (!res) res = "00"

	print substr(res, 1, length(res)-1)
}

function die(msg, code) {
	print msg > "/dev/stderr"
	status = code
	exit code
}

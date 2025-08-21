#!/usr/bin/env gawk -f

{
	while(++i <= NF) 
		if ($i < 0 || $i > 7)
			die("invalid")
}

$1 == $3 && $2 == $4 { die("invalid") }

$1 == $3 { end("true") }

$2 == $4 { end("true") }

# slope of perfect diagonal is 1 or -1
# slope formula m = (y2 - y1) / (x2 - x1)
# |Dy/Dx| = 1, |Dy| = |Dx|, |m| = 1
# if Dy = 1, Dx = -1: m = -1, |m| = 1
# if Dy = -1, Dx = 1: m = -1, |m| = 1
abs($1 - $3) == abs($2 - $4) { end("true") }

{ end("false") }

function end(msg) {
	print msg
	exit 0
}

function die(msg) {
	print msg
	exit 1
}

function abs(num) {
	return (num < 0) ? num * -1 : num
}

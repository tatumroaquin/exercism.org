#!/usr/bin/env gawk

BEGIN {
	FS = "-|T|:"
	giga = 10^9
}

{
	for (i = 4; i <= 6; i++) $i += 0
	secs = mktime($0, 1) + giga
	print strftime("%FT%T", secs, 1)
}

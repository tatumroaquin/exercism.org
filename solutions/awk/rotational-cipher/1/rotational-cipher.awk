#!/usr/bin/env gawk -f

@include "ord"

# These variables are initialized on the command line (using '-v'):
# - distance

BEGIN { 
	FS = OFS = ""
}

{
	for (i = 1; i <= NF; i++) {
		if ($i !~ /[[:alpha:]]/) continue
		if ($i ~ /[[:upper:]]/) offset = ord("A")
		if ($i ~ /[[:lower:]]/) offset = ord("a")
		c = (ord($i) + distance - offset) % 26
		$i = chr(c + offset)
	}

	print
}

#!/usr/bin/env gawk
BEGIN {
	FS = ""
}
{
	reverse = ""

	for (i = NF; i >= 1; i--) {
		reverse = reverse $i
	}

	print reverse
}

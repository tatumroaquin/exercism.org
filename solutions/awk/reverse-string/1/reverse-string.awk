#!/usr/bin/env gawk

{
	if ($0 == "") {
		print $0
		exit
	}

	reverse = ""
	for (i = length($0); i >= 1; i--) {
		reverse = reverse substr($0, i, 1)
	}
	print reverse
}

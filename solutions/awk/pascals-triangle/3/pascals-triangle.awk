#!/usr/bin/env gawk

{
	cnt = $0
	$0 = 1

	while (cnt--) {
		print
		for (c = NF+1; c > 1; c--) {
			$c = $c + $(c - 1)
		}
	}
}

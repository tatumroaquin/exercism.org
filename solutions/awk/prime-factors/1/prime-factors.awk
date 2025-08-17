#!/usr/bin/env gawk

# trial division algorithm

{
	num = $1

	for (d = 2; d <= sqrt(num); d++) {
		while (num % d == 0) {
			$(NF++) = d
			num /= d
		}
	}

	(num > 1) ? $NF = num : NF--

	print
}

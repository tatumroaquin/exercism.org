#!/usr/bin/env gawk

{
	count = 0
	num = $1
	while (num > 0) {
		count += (num % 2)
		num = int(num / 2)
	}
	print count
}

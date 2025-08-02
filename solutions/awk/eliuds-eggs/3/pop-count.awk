#!/usr/bin/env gawk

{
	count = 0
	num = $1
	while (num > 0) {
		count += and(num, 1)
		num = rshift(num, 1)
	}
	print count
}

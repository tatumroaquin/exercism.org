#!/usr/bin/env gawk

# We remember the Pythagorean Theorem a^2+b^2=c^2
# Looking for the missing hypotenuse of the triangle

function abs(num) {
	return num < 0 ? (num * -1) : num
}

{
	x = abs($1)
	y = abs($2)
	hyp = sqrt(x^2 + y^2)
}

hyp > 10 {
	print 0
	next
}

hyp <= 1 {
	print 10
	next
}

hyp <= 5 {
	print 5
	next
}

hyp <= 10 {
	print 1
	next
}

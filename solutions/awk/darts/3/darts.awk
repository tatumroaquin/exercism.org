#!/usr/bin/env gawk

# We remember the Pythagorean Theorem a^2+b^2=c^2
# Looking for the missing hypotenuse of the triangle

{
	x = $1
	y = $2
	distance = sqrt(x^2 + y^2)
}

distance > 10 {
	score = 0
}

distance <= 10 {
	score = 1
}

distance <= 5 {
	score = 5
}

distance <= 1 {
	score = 10
}

END {
	print score
}

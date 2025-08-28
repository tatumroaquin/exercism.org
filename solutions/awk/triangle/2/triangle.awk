#!/usr/bin/env gawk -f

! is_triangle($1,$2,$3) {
	out("false")
}

{
	delete sides
	for (i = 1; i <= 3; i++) {
		sides[$i] = 1
	}
	uniq = length(sides)
}

type == "equilateral"	{ uniq == 1 ? out("true") : out("false") }
type == "isosceles"		{ uniq <= 2 ? out("true") : out("false") }
type == "scalene"		{ uniq == 3 ? out("true") : out("false") }

function is_triangle(a,b,c) {
	no_zeros = a*b*c
	inequality = a+b>=c && a+c>=b && b+c>=a
	return no_zeros && inequality
}

function out(msg) {
	print msg
	exit
}

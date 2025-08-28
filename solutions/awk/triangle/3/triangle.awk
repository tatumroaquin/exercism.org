#!/usr/bin/env gawk -f

# https://www.man7.org/linux/man-pages/man1/gawk.1.html#USER-DEFINED_FUNCTIONS
{ print is_triangle($1,$2,$3) && @type($1,$2,$3) ? "true" : "false" }

function is_triangle(a,b,c) {
	return (a+b)>c && (b+c)>a && (c+a)>b
}

function equilateral(a,b,c) {
	return a == b && b == c
}

function isosceles(a,b,c) {
	return a == b || b == c || c == a
}

function scalene(a,b,c) {
	return a != b && b != c && c != a
}

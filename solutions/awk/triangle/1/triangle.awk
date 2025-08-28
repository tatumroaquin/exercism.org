#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - type

{ if (!is_triangle($1, $2, $3)) out("false") }

type == "equilateral" {
	if (is_equilateral($1, $2, $3)) out("true")
}

type == "scalene" {
	if (is_scalene($1, $2, $3)) out("true")
}

type == "isosceles" {
	if (is_isosceles($1, $2, $3)) out("true")
}

{ out("false") }

function is_triangle(a, b, c) {
	nozeroval	= a+b+c
	inequality	= (a+b)>=c && (a+c)>=b && (b+c)>=a
	return nozeroval && inequality
}

function is_equilateral(a, b, c) {
	return a == b && a == c && b == c
}

function is_scalene(a, b, c) {
	return a != b && a != c && b != c
}

function is_isosceles(a, b, c) {
	return is_equilateral(a, b, c) || !is_scalene(a, b, c)
}

function out(msg) {
	print msg
	exit
}

NF {
	for (i = 2; i <= NF; i++) {
		print "For want of a " $(i-1) " the " $i " was lost."
	}
	print "And all for the want of a " $1 "."
}

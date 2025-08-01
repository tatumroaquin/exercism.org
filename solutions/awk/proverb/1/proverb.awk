{
 len = split($0, items)

 if (len == 0) {
	 exit
 }

 if (len < 2) {
	 print "And all for the want of a " $0 "."
	 exit
 }

 for (i = 1; i < len; i++) {
	 print "For want of a " items[i] " the " items[i+1] " was lost."
 }

 print "And all for the want of a " items[1] "."
}

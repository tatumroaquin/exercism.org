{
	num = $0

	if (num == "total") {
		print (2^64 - 1)
		exit 0
	}

	if (num < 1 || num > 64) {
		print "square must be between 1 and 64"
		exit 1
	}

	print 2^(num-1)
}

{
	if ($0 <= 0) {
		print "Error: Only positive numbers are allowed"
		exit 1
	}

	num = $0
	steps = 0
	while (num > 1) {
		steps++

		if (num % 2 == 0) {
			num = num / 2
		} else {
			num = num * 3 + 1
		}
	}

	print steps
}
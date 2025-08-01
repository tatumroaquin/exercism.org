{
	len_input = split($0, parts, ",")
	mode = parts[1]
	num = parts[2]

	if (mode == "square_of_sum") {
		# Gauss Summation Arithmetic Sequence
		sum = (num + 1) * (num / 2)
		print sum^2
	}

	if (mode == "sum_of_squares") {
		# Closed-form formula for sum of squares
		sum = (num + 1) * (2*num + 1) * (num / 6)
		print sum
	}

	if (mode == "difference") {
		# https://brilliant.org/wiki/sum-of-n-n2-or-n3/
		square_of_sum = ((1 + num) * (num / 2))^2
		sum_of_squares = (num + 1) * (2*num + 1) * (num / 6)
		difference = square_of_sum - sum_of_squares
		print difference
	}
}

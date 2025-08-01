{
	len_input = split($0, parts, ",")
	mode = parts[1]
	num = parts[2]

	if (mode == "square_of_sum") {
		sum = (1 + num) * (num / 2)
		print sum^2
	}

	if (mode == "sum_of_squares") {
		sum = 0
		for (i = 1; i <= num; i++) {
			sum = sum + (i^2)
		}
		print sum
	}

	if (mode == "difference") {
		square_of_sum = ((1 + num) * (num / 2))^2
		sum_of_squares = 0
		for (i = 1; i <= num; i++) {
			sum_of_squares = sum_of_squares + (i^2)
		}
		difference = square_of_sum - sum_of_squares
		print difference
	}
}

#!/usr/bin/env gawk

{
	gsub(/[-]/, "")
	len = split($0, nums, "")
	digits = substr($0, 1, length($0) - 1)
	check = nums[len]

	if (len < 10 || 10 < len ) {
		print "false"
		next
	}

	if (digits ~ /[A-Z]/)  {
		print "false"
		next
	}

	if (check !~ /[0-9X]/) {
		print "false"
		next
	}

	if (check == "X") nums[len] = 10
	
	for (i = 0; i < 10; i++) {
		sum += (10 - i) * nums[i + 1]
	}

	print sum % 11 == 0 ? "true" : "false"
}

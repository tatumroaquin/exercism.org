#!/usr/bin/env gawk -f

BEGIN {
	FS = OFS = ","
	len = split("wink,double blink,close your eyes,jump",acts)
	for (i = 1; i <= len; i++) {
		nums[acts[i]] = 2^(i-1)
	}
}

{
	num = $NF

	NF--
	for (i = 1; i <= len; i++) {
		if (and(num, nums[acts[i]])) 
			$(++NF) = acts[i]
	}

	if (and(num, 16)) {
		for (i = 1; i <= NF/2; i++) {
			_i = $i
			$i = $(NF-i+1)
			$(NF-i+1) = _i
		}
	}

	print
}

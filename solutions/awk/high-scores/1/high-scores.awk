{
	if ($1 ~ /[[:digit:]]/) {
		nums[++i] = $1
	} else {
		cmds[++j] = $1
	}
}

END {
	for (idx in cmds) {
		exec(cmds[idx], nums)
	}
}

function exec(cmd, nums) {
	switch (cmd) {
		case "list":
			list(nums)
			break
		case "latest":
			latest(nums)
			break
		case "personalBest":
			personal_best(nums)
			break
		case "personalTopThree":
			personal_top_three(nums)
			break
	}
}

function list(nums, idx) {
	for (idx in nums) {
		print nums[idx]
	}
}

function latest(nums, idx) {
	print nums[length(nums)]
}

function personal_best(nums, max, idx) {
	max = 0
	for (idx in nums) {
		if (max < nums[idx])
			max = nums[idx]
	}
	print max
}

function max(val1, val2) {
	return val1 > val2 ? val1 : val2
}

function personal_top_three(nums, sorted, idx, len, start, i) {
	asort(nums, sorted)
	len = length(sorted)
	end = max(1, len - 2)
	for (i = len; i >= end; i--) {
		print sorted[i]
	}
}

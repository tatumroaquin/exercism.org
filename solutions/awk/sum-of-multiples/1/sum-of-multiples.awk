# These variables are initialized on the command line (using '-v'):
# - limit

{
	for (i = 1; i <= NF; i++) {
		if ($i == 0) continue
		for (j = $i; j < limit; j+=$i)
			mults[j] = j
	}

	for (m in mults) res += m

	print res ? res : 0
}

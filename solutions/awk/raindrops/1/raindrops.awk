BEGIN {
	string = ""

	if (num % 3 == 0)
		string = string "Pling"
	if (num % 5 == 0)
		string = string "Plang"
	if (num % 7 == 0)
		string = string "Plong"

	if (string == "")
		print num
	else
		print string
}

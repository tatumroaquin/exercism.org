#!/usr/bin/env gawk

function normalize(hour, mins) {
	while (mins < 0) {
		mins += 60
		hour -= 1
	}

	while (hour < 0) {
		hour += 24
	}

	hour += int(mins/60)
	hour %= 24
	mins %= 60

	return sprintf("%02d:%02d", hour, mins)
}

$1 == "create" {
	hour = $2
	mins = $3

	print normalize(hour, mins)
	next
}

$1 == "add" {
	hour = $2
	mins = $3
	delta = $4

	print normalize(hour, mins + delta)
	next
}

$1 == "subtract" {
	hour = $2
	mins = $3
	delta = $4

	print normalize(hour, mins - delta)
	next
}

$1 == "equal" {
	hour1 = $2
	mins1 = $3
	hour2 = $4
	mins2 = $5

	clock1 = normalize(hour1, mins1)
	clock2 = normalize(hour2, mins2)

	print clock1 == clock2 ? "true" : "false"
}

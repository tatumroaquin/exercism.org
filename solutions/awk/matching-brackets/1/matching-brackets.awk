#!/usr/bin/env gawk

BEGIN { FS = "" }

{
	gsub(/[^\(\)\[\]\{\}]/, "")
	stack = ""
	for (i = 1; i <= NF; i++) {
		if ($i == ")" && peek(stack) == "(") {
			stack = pop(stack)
		}
		else if ($i == "]" && peek(stack) == "[") {
			stack = pop(stack)
		}
		else if ($i == "}" && peek(stack) == "{") {
			stack = pop(stack)
		}
		else {
			stack = stack $i
		}
	}

	print length(stack) ? "false" : "true"
}

function peek(stack) {
	return substr(stack, length(stack), 1)
}

function pop(stack) {
	return substr(stack, 1, length(stack) - 1)
}

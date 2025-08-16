#!/usr/bin/env gawk

BEGIN {
    FS = ""
    pairs[")"] = "("
    pairs["]"] = "["
    pairs["}"] = "{"
}

{
    gsub(/[^\(\)\[\]\{\}]/, "")

	# initialise stack as empty
    delete stack

    for (c = 1; c <= NF; c++) {
        if ($c in pairs && peek(stack) == pairs[$c]) {
            top = pop(stack)
        } else {
            top = push(stack, $c)
        }
    }

    print (top == 0 ? "true" : "false")
}

function push(stack, c) {
    stack[++top] = c
    return top
}

function pop(stack) {
    delete stack[top]
    return --top
}

function peek(stack) {
    return (top > 0 ? stack[top] : "")
}


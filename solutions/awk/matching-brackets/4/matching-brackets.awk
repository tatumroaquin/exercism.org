#!/usr/bin/env gawk

BEGIN {
    FPAT = "[][(){}]"
    pairs[")"] = "("
    pairs["]"] = "["
    pairs["}"] = "{"
}

{
    for (c = 1; c <= NF; c++) {
        if ($c in pairs && peek(stack) == pairs[$c]) {
            pop(stack)
        } else {
            push(stack, $c)
        }
    }

    print (top == 0 ? "true" : "false")
}

function push(stack, char) {
    stack[++top] = char
}

function pop(stack) {
    delete stack[top--]
}

function peek(stack) {
    return (top > 0 ? stack[top] : "")
}


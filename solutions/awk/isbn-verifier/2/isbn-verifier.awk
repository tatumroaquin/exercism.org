#!/usr/bin/env gawk

BEGIN {
    FPAT = "[0-9]|X$" # field pattern
}

! /^[0-9-]*(X)?$/ {
    # starting with a number, ending with optional X
    print "false"
    next
}

NF != 10 {
    print "false"
    next
}

$NF == "X" { $NF = 10 }

{
    for (i = 1; i <= NF; i++) {
        sum += (11 - i) * $i
    }
    print sum % 11 ? "false" : "true"
}

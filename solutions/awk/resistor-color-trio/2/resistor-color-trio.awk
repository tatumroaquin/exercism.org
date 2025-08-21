#!/usr/bin/env gawk -f

BEGIN {
    map["black"]  = 0; map["green"]  = 5
    map["brown"]  = 1; map["blue"]   = 6
    map["red"]    = 2; map["violet"] = 7
    map["orange"] = 3; map["grey"]   = 8
    map["yellow"] = 4; map["white"]  = 9

    split("kilo mega giga", prefix)
}

{
    for (i = 1; i <= NF; i++) {
        if (!($i in map)) {
            print "invalid color"
            exit 1
        }
    }

    value = (map[$1] * 10 + map[$2]) * 10^map[$3]

    while (value && value % 1000 == 0) {
        value /= 1000
        p++
    }

    print value, prefix[p] "ohms"
}

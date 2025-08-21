#!/usr/bin/env gawk -f

BEGIN {
    map["black"] = 0
    map["brown"] = 1
    map["red"] = 2
    map["orange"] = 3
    map["yellow"] = 4

    map["green"] = 5
    map["blue"] = 6
    map["violet"] = 7
    map["grey"] = 8
    map["white"] = 9
}

{
    for (i = 1; i < 3; i++) {
        if (!($i in map)) die("invalid color")
        value = value * 10 + map[$i]
    }

    if (!($3 in map)) die("invalid color")

    value = value * (10^map[$3])

    if (2*10^3 <= value && value < 10^6) {
        print (value / 10^3), "kiloohms"
        exit
    }
    if (10^6 <= value && value < 10^9) {
        print (value / 10^6), "megaohms"
        exit
    }
    if (10^9 <= value && value < 10^12) {
        print (value / 10^9), "gigaohms"
        exit
    }

    print value, "ohms"
}

function die(msg) {
    print msg
    exit 1
}

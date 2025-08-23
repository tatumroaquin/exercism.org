#!/usr/bin/env gawk -f

BEGIN {
    FS = OFS = ","
    len = split("wink,double blink,close your eyes,jump",acts)
}

{
    num = $NF; NF = 0

    for (i = 1; i <= len; i++) {
        if (and(num, lshift(1, i-1))) 
            $(++NF) = acts[i]
    }

    if (and(num, 16)) {
        for (i = 1; i <= int(NF/2); i++) {
            temp      = $i
            $i        = $(NF-i+1)
            $(NF-i+1) = temp
        }
    }

    print
}

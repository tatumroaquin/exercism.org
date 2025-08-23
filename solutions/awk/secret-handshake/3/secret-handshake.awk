#!/usr/bin/env gawk -f

BEGIN {
    FS = OFS = ","
    split("wink,double blink,close your eyes,jump", acts)
}

{
    num = $NF; NF = 0

    PROCINFO["sorted_in"] = sortOrder(num)
    for (a in acts) {
        if (and(num, lshift(1, a-1))) 
            $(++NF) = acts[a]
    }

    print
}

function sortOrder(num) {
    if (and(num, 16))
        return "@ind_num_desc"
    return "@ind_num_asc"
}

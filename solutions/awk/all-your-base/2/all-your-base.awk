#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - ibase
# - obase

ibase < 2 { die("invalid ibase", 1) }
obase < 2 { die("invalid obase", 1) }
NF == 0   { die("", 0) }

{
    for (i = NF; i > 0; i--) {
        if (ibase <= $i || $i < 0) {
            die("invalid digit", 1)
        }
        dec += $i * (ibase ^(NF-i))
    }
}

END {
    if (status != "") exit status

    $0 = ""
    while (dec != 0) {
        $(++f)  = (dec % obase)
        dec     = int(dec / obase)
    }

    reverse()

    print !NF ? 0 : $0
    
}

function die(msg, code) {
    print msg > "/dev/stderr"
    status = code
    exit code
}

function reverse() {
    l = 1; r = NF
    while (l < r) {
        t = $l
        $l = $r
        $r = t
        l++; r--;
    }
}

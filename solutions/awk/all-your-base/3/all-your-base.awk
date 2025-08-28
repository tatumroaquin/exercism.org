#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - ibase
# - obase

ibase < 2 { die("invalid ibase", 1) }
obase < 2 { die("invalid obase", 1) }
NF == 0   { die("", 0) }

{
    # convert input number into decimal
    for (i = NF; i > 0; i--) {
        if ($i < 0 || ibase <= $i )
            die("invalid digit", 1)
        dec += $i * (ibase^(NF-i))
    }
}

END {
    if (status != "") exit status

    # convert decimal to output base
    NF = 0
    while (dec != 0) {
        $(++NF) = dec % obase
        dec     = int(dec / obase)
    }

    # reverse values in the fields
    l = 0; r = NF+1
    while (++l < --r) {
        t = $l; $l = $r; $r = t;
    }

    print !NF ? 0 : $0
    
}

function die(msg, code) {
    print msg > "/dev/stderr"
    status = code
    exit code
}

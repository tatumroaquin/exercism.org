#!/usr/bin/env gawk

BEGIN {
    PROCINFO["sorted_in"] = "@val_num_desc"
}

$1 ~ /[0-9]/                { scores[++c] = $1 }
$1 == "latest"              { print scores[c] }
$1 == "list"                { while(++i <= c) print scores[i] }
$1 == "personalBest"        { top_scores(1, scores) }
$1 == "personalTopThree"    { top_scores(3, scores) }

function top_scores(num, scores, idx, cnt) {
    for (idx in scores) {
        print scores[idx]
        # sorted_in affects key=>val order
        # independent counter is needed
        if (++cnt == num) break
    }
}

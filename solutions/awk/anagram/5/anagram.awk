#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - key

BEGIN {
    PROCINFO["sorted_in"] = "@val_str_asc"
    key_sorted = word_sorter(key)
}

tolower(key) == tolower($1) { next }

key_sorted == word_sorter($1)

function word_sorter(word, chars, res) {
    split(tolower(word), chars, "")
    for (c in chars)
        res = res chars[c]
    return res
}

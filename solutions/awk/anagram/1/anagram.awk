#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - key

# collect all non-duplicate words to an array

@include "join"

BEGIN { SUBSEP = " " }

# deny duplicate words matching key
{ if (tolower(key) == tolower($1)) next }

{ if (anagram(key, $1)) res[++r] = $1 }

END {
    for (idx in res) print res[idx]
}

function anagram(word1, word2, chars1, chars2, sorted1, sorted2) {
    len1 = split(tolower(word1), chars1, "")
    len2 = split(tolower(word2), chars2, "")

    asort(chars1, sorted1)
    asort(chars2, sorted2)

    word1 = join(sorted1, 0, length(sorted1), " ")
    word2 = join(sorted2, 0, length(sorted2), " ")

    return word1 == word2
}

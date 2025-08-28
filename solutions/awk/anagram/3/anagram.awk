#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - key

# deny duplicate words matching key
{ if (tolower(key) == tolower($1)) next }

{ if (anagram(key, $1)) res[++r] = $1 }

END {
    for (idx in res) print res[idx]
}

function anagram(word1, word2, i) {
    if (length(word1) != length(word2))
        return false

    word1 = tolower(word1)
    word2 = tolower(word2)

    len = split(word1, chars, "")
    for (i = 1; i <= len; i++) {
        sub(chars[i], "", word2)
    }

    return word2 == ""
}

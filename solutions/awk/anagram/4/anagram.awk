#!/usr/bin/env gawk -f

# These variables are initialized on the command line (using '-v'):
# - key

# deny duplicate words matching key
tolower(key) == tolower($1) { next }

# https://man.cx/gawk#heading9
anagram(key, $1)

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

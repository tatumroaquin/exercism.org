#!/usr/bin/env gawk

BEGIN {
  input = ""
}

{
  # Accumulate multi-line input
  input = input $0
}

END {
  # Trim whitespace characters
  gsub(/^[ \t\r]+|[ \t\r]+$/, "", input)

  if (length(input) == 0) {
    print "Fine. Be that way!"
    exit
  }

  is_question = input ~ /\?+$/
  has_letters = input ~ /[[:alpha:]]/
  is_yelling = has_letters && input == toupper(input)

  if (is_question && is_yelling) {
    print "Calm down, I know what I'm doing!"
  } else if (is_yelling) {
    print "Whoa, chill out!"
  } else if (is_question) {
    print "Sure."
  } else {
    print "Whatever."
  }
}


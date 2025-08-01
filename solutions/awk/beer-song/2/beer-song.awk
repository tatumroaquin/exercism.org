#!/usr/bin/env gawk

function get_verse(before,after) {
  p_bottle = before != 1 ? "bottles" : "bottle"
  n_bottle = after != 1 ? "bottles" : "bottle"

  print (before ? before : "No more") " " p_bottle " of beer on the wall, " (before ? before : "no more") " " p_bottle " of beer."

  if (before == 0) {
    print "Go to the store and buy some more, 99 bottles of beer on the wall."
    return
  }

  print "Take " (after >= 1 ? "one" : "it") " down and pass it around, " (after >= 1 ? after : "no more") " " n_bottle " of beer on the wall."
}

BEGIN {
  if (start != "" && stop != "") {
    for (i = start; i >= stop; i--) {
      get_verse(i, i-1)
    }
    exit
  }

  get_verse(verse, verse-1)
}

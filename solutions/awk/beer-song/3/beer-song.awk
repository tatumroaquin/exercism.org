#!/usr/bin/env gawk

function pluralize(count, noun) {
  return count == 1 ? noun : noun "s"
}

function get_verse(cur,nxt) {

  print (cur ? cur : "No more") " " pluralize(cur, "bottle") " of beer on the wall, " \
        (cur ? cur : "no more") " " pluralize(cur, "bottle") " of beer."

  if (cur == 0) {
    print "Go to the store and buy some more, 99 bottles of beer on the wall."
    return
  }

  print "Take " (nxt ? "one" : "it") " down and pass it around, " \
        (nxt ? nxt : "no more") " " pluralize(nxt, "bottle") " of beer on the wall."
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

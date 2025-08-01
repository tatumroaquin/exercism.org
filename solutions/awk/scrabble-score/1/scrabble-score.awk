#!/usr/bin/env gawk

BEGIN {
  letters = "AEIOULNRST,DG,BCMP,FHVWY,K,JX,QZ"
  values = "1,2,3,4,5,8,10"

  split(letters, chunks, ",")
  split(values, nums, ",")

  for (i = 1; i <= length(nums); i++) {
    len_chunk = split(chunks[i], chars, "")
    for(j = 1; j <= len_chunk; j++) {
      map[chars[j]] = nums[i]
    }
  }
}

{
  word = toupper($0)
  score = 0

  for (i = 1; i <= length(word); i++) {
    score += map[substr(word, i, 1)]
  }

  print word "," score
}

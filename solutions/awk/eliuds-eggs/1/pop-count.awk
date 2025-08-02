#!/usr/bin/env gawk

function dec2bin(num, bin) {
    while(num) {
        bin = (num % 2) bin
        num = int(num / 2)
    }
    return(bin ? bin : 0)
}

{
	binary = dec2bin($1)
	gsub(/0/, "", binary)
	print length(binary)
}

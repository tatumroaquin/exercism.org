#!/usr/bin/env gawk

# wheel factorization algorithm
# skip multiples of 2,3,5
# LCM of (2,3,5) is 30
# coprimes lesser than 30 are 1,7,11,13,17,19,23,29
# calculate distances between the coprime numbers

#  7 - 1  = 6
# 11 - 7  = 4
# 13 - 11 = 2
# 17 - 13 = 4
# 19 - 17 = 2
# 23 - 19 = 4
# 29 - 23 = 6

# cycle of distances has a repeating pattern
# to complete the loop we add a wrap distance

# formula to calc next distance in the series 
# (a_1+m)-a_n | (1+30)-29 = 2

# starting from 1 we loop thru step distances
# (6) (4) (2) (4) (2) (4) (6) (2)

# starting from 7 we rotate one turn to the left
# (4) (2) (4) (2) (4) (6) (2) (6) 

{

    primes[1] = 2
    primes[2] = 3
    primes[3] = 5

    num = $1

    for (p = 1; p <= length(primes); p++) {
        while (num % primes[p] == 0) {
            $(NF++) = primes[p]
            num /= primes[p]
        }
    }

    split("4 2 4 2 4 6 2 6", steps, " ")

    for (d = 7; d <= sqrt(num); d += steps[++i]) {
        while (num % d == 0) {
            $(NF++) = d
            num /= d
        }
        if (i == 8) i = 0
    }

    if (num > 1) 
        $NF = num
    else
        NF--

    print
}

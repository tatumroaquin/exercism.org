#!/usr/bin/env gawk -f

# IEP = Inclusion Exclusion Principle
# Example Table for divisors (2,3,5,7,11)
# |Mask      |Subset      |bits|LCM |Sign  |Term            |
# |----------|------------|----|----|------|----------------|
# |00001 (1) |{2}         |1   |2   |+  Odd|+ sum_mult(2)   |
# |00010 (2) |{3}         |1   |3   |+  Odd|+ sum_mult(3)   |
# |00011 (3) |{2,3}       |2   |6   |– Even|– sum_mult(6)   |
# |00100 (4) |{5}         |1   |5   |+  Odd|+ sum_mult(5)   |
# |00101 (5) |{2,5}       |2   |10  |– Even|– sum_mult(10)  |
# |00110 (6) |{3,5}       |2   |15  |– Even|– sum_mult(15)  |
# |00111 (7) |{2,3,5}     |3   |30  |+  Odd|+ sum_mult(30)  |
# |01000 (8) |{7}         |1   |7   |+  Odd|+ sum_mult(7)   |
# |01001 (9) |{2,7}       |2   |14  |– Even|– sum_mult(14)  |
# |01010 (10)|{3,7}       |2   |21  |– Even|– sum_mult(21)  |
# |01011 (11)|{2,3,7}     |3   |42  |+  Odd|+ sum_mult(42)  |
# |...       |...         |... |... |...   |...             |
# |11111 (31)|{2,3,5,7,11}|5   |2310|+  Odd|+ sum_mult(2310)|

{
    for (i = 1; i <= NF; i++) {
        divisors[i-1] = $i
    }

    for (mask = 1; mask < lshift(1, NF); mask++) {
        prod = 1
        bits = 0
        for (i = 0; i < NF; i++) {
            if (and(mask, lshift(1, i))) {
                prod = lcm(prod, divisors[i])
                bits++
            }
        }
        res += (bits % 2 ? 1 : -1) * sum_of_mult(prod, limit)
    }

    print res ? res : 0
}

function gcd(a, b) {
    while (b != 0) {
        c = b
        b = a % b
        a = c
    }
    return a
}

function lcm(a, b) {
    return a * b / gcd(a, b)
}

function sum_of_mult(num, limit, k) {
    if (!num) return 0

    k = int((limit-1)/num)

    # Gauss summation formula n(n+1)/2
    # Number multiplied as prefix
    return num * k * (k + 1) / 2
}

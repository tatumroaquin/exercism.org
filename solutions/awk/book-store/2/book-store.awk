#!/usr/bin/env -S gawk -f

BEGIN {
    for (i = 5; i; --i)
        Books[i] = 0

    Price[1] = 8 * 100
    Price[2] = 8 * 95
    Price[3] = 8 * 90
    Price[4] = 8 * 80
    Price[5] = 8 * 75
}

{
    ++Books[$1]
}

END {
    # sort ascending order example [3,3,5,5,5]
    n = asort(Books)

    # peel the rows/layers of the sorted histogram
    # Group[5] = Books[1] - Books[0] = 3
    # Group[4] = Books[2] - Books[1] = 0
    # Group[3] = Books[3] - Books[2] = 2
    # Group[2] = Books[4] - Books[3] = 0
    # Group[1] = Books[5] - Books[4] = 0
    for (i = 5; i; --i)
        Group[i] = Books[6 - i] - Books[5 - i]

    # if we have both 5x3 groups it can be regrouped to a 4x4
    # but only as many times as the lesser qty of two groups

    # so we take the minimum amount of (Group[3], Group[5])
    # N = min(2, 3) = 2
    combined = Group[3] < Group[5] ? Group[3] : Group[5]

    Group[3] -= combined        # lose  N groups of 3
    Group[5] -= combined        # lose  N groups of 5
    Group[4] += 2 * combined    # gain 2N groups of 4

    for (i = 5; i; --i)
        total += Price[i] * Group[i] * i

    print total
}


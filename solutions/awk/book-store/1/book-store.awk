#!/usr/bin/env gawk -f

BEGIN {
    book_price  = 800
    basket_size = 5

    discount[1] = 1.00
    discount[2] = 0.95
    discount[3] = 0.90
    discount[4] = 0.80
    discount[5] = 0.75
}

{ basket[$1 - 1]++ }

END {
    result = min_price(basket, encode_key(key))
    print result
}

function min_price(basket, group_key, mask, new_basket, best_price) {
    if (is_empty(basket))   return 0
    if (memo[group_key])    return memo[group_key]

    best_price = 2^PREC

    for (mask = 1; mask < lshift(1, basket_size); mask++) {
        mask_valid = 1

        for (i = 0; i < basket_size; i++) {
            if (and(rshift(mask, i), 1) && basket[i] == 0) {
                mask_valid = 0;
                break
            }
        }

        if (!mask_valid) continue

        delete new_basket
        for (i = 0; i < basket_size; i++) {
            new_basket[i] = basket[i]

            if (and(rshift(mask, i), 1))
                new_basket[i]--
        }

        group_size  = bit_count(mask)
        curr_cost   = get_price(group_size)
        next_cost   = min_price(new_basket, encode_key(new_basket))

        if (curr_cost + next_cost < best_price)
            best_price = curr_cost + next_cost
    }

    memo[group_key] = best_price
    return best_price
}

function bit_count(num, count) {
    for (count = 0; num; num = rshift(num, 1))
        count += and(num, 1)
    return count
}

function get_price(amount) {
    return book_price * amount * discount[amount]
}

function is_empty(basket, idx, res) {
    for (i = 0 ; i < basket_size; i++) {
        if (basket[i] > 0) return 0
    }
    return 1
}

function encode_key(basket, i, key) {
    key = basket[0]
    for (i = 1; i < basket_size; i++) {
        key = key "," basket[i]
    }
    return key
}

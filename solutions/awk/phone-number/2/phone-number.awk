#!/usr/bin/env gawk

function err(message) {
    print message
    exit 1
}

{ gsub(/[-+.( )]/, "") }

/[[:alpha:]]/               { err("letters not permitted") }
/[^[:digit:]]/              { err("punctuations not permitted") }
length() < 10               { err("must not be fewer than 10 digits") }
length() > 11               { err("must not be greater than 11 digits") }
length() == 11 && /^[^1]/   { err("11 digits must start with 1") }
length() == 11              { sub(/^1/, "") }
/^0/                        { err("area code cannot start with zero") }
/^1/                        { err("area code cannot start with one") }
/^...0/                     { err("exchange code cannot start with zero") }
/^...1/                     { err("exchange code cannot start with one") }

$0

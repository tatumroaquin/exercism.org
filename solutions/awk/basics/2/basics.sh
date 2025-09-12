#!/bin/sh

## task 1
awk -F':' '{ print $1 }' ./passwd

## task 2
awk '{ print NR }' ./passwd

## task 3
# https://man.cx/gawk#heading9
awk -F':' '$6 !~ /^\/(home|root)/' ./passwd

## task 4
awk -F':' '$6 ~ /^\/(home|root)/ && $7 ~ /bash/' ./passwd

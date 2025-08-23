#!/usr/bin/env gawk -f

@include "assert"

BEGIN {
    OFMT = "%.2f"

    periods["Mercury"]  = 365.25 * 0.2408467
    periods["Venus"]    = 365.25 * 0.61519726
    periods["Earth"]    = 365.25 * 1.0
    periods["Mars"]     = 365.25 * 1.8808158
    periods["Jupiter"]  = 365.25 * 11.862615
    periods["Saturn"]   = 365.25 * 29.447498
    periods["Uranus"]   = 365.25 * 84.016846
    periods["Neptune"]  = 365.25 * 164.79132
}

{
    planet = $1
    epoch = $2

    assert(planet in periods, "not a planet")

    hours = epoch / 60^2
    days  = hours / 24
    years = days / periods[planet]

    print years
}

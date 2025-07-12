#!/bin/bash
# Usage: ./makePoints.sh <logfile>

grep -oE '[0-9]+\.[0-9]{4}e[+-][0-9]+' "$1" | awk '
{
    val = $1 + 0
    sum += val
    count++
    if (min == "" || val < min) min = val
    if (max == "" || val > max) max = val
}
END {
    if (count > 0) {
        avg = sum / count
        printf "Average: %.6e\n", avg
        printf "Lowest:  %.6e\n", min
        printf "Highest: %.6e\n", max
    } else {
        print "No values found."
    }
}
'

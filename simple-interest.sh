#!/usr/bin/env bash
# simple-interest.sh
# This script calculates simple interest using the formula:
# Simple Interest = (Principal * Rate * Time) / 100

# Check input count
if [ $# -ne 3 ]; then
    echo "Usage: $0 PRINCIPAL RATE TIME"
    echo "Example: $0 1000 5 2"
    exit 1
fi

P=$1
R=$2
T=$3

# Validate numeric input
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re && $R =~ $re && $T =~ $re ]]; then
    echo "Error: All arguments must be numbers."
    exit 2
fi

# Calculate simple interest using bc (float calculator)
SI=$(echo "scale=2; ($P * $R * $T) / 100" | bc -l)

echo "Simple Interest: $SI"

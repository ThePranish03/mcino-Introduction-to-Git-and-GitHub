#!/bin/bash
# This script calculates simple interest given principal, annual rate of interest and time period in years.
# Do not use this in production. Sample purpose only.

# Author: Upkar Lidder (IBM)
# Additional Authors:
# <your Github username>

# Input:
# p, principal amount
# t, time period in years
# r, annual rate of interest

# Output:
# simple interest = (p*t*r)/100

read -r -p "Enter the principal: " p
read -r -p "Enter rate of interest per year: " r
read -r -p "Enter time period in years: " t

if ! simple_interest=$(awk -v principal="$p" -v rate="$r" -v period="$t" '
    BEGIN {
        number = "^[0-9]+([.][0-9]+)?$"
        if (principal !~ number || rate !~ number || period !~ number) {
            print "Error: principal, rate, and time must be non-negative numbers." > "/dev/stderr"
            exit 1
        }
        printf "%.2f", (principal * rate * period) / 100
    }
'); then
    exit 1
fi

printf "The simple interest is: %s\n" "$simple_interest"

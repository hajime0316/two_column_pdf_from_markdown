#!/bin/bash

body_flag=0

cat "${1:?No input file}" | while read line; do
    if [ "$body_flag" == 0 ]; then
        if [[ $line =~ ^\<div\ +class\ *=\ *\"date\"\ *\> ]]; then
            body_flag=1
        fi
        echo "$line" |
            sed -E -n '/(^\# +|^<div +class *= *("author"|"date") *>)/p' |
            sed -E 's/^\# +/% /' |
            sed -E 's/^<div +class *= *("author"|"date") *>/% /' |
            sed -E 's@</div *>@@'
    else
        echo "$line" |
        sed -E 's/^#//'
    fi
done

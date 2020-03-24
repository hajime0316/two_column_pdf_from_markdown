#!/bin/bash

make_header() {
    local body_flag=0

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
}

make_header "$1" | pandoc --data-dir=. -s -f markdown-auto_identifiers -t latex -o test.tex

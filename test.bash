#!/bin/bash

header_flag=0
body_flag=0

# sed -E s/'^\# +'/'% '/ test.md
# sed -E s/'^<\s*?div.*?("author"|"date")\s*?>'/'% '/ test.md
# sed -E s@'<\s*?/div\s*?>'@@ test.md

line_num=1

# cat test.md | sed -E s/'^\# +'/'% '/ | sed -E s/'^<\s*?div.*?("author"|"date")\s*?>'/'% '/ | sed -E s@'<\s*?/div\s*?>'@@ |
#     while read line; do
#         echo "$line"
#     done

cat test.md | while read line; do
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
        echo "$line"
    fi
done

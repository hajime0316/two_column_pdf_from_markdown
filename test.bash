#!/bin/bash

header_flag=0

# sed -E s/'^\# +'/'% '/ test.md
# sed -E s/'^<\s*?div.*?("author"|"date")\s*?>'/'% '/ test.md
# sed -E s@'<\s*?/div\s*?>'@@ test.md

line_num=1

cat test.md | sed -E s/'^\# +'/'% '/ | sed -E s/'^<\s*?div.*?("author"|"date")\s*?>'/'% '/ | sed -E s@'<\s*?/div\s*?>'@@ |
    while read line; do
        echo "$line"
    done

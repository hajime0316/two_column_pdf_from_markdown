#!/bin/bash

local header_flag=0

sed -E s/'^\# +'/'% '/ test.md
sed -E s/'^<\s*?div.*?("author"|"date")\s*?>'/'% '/ test.md
sed -E s@'<\s*?/div\s*?>'@@ test.md

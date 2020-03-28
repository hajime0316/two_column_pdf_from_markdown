#!/bin/bash

input_file="${1:?No input file}"
if [[ ! $input_file =~ ^\./.*$ ]]; then
    input_file="./$input_file"
fi

input_file_dir="${input_file%/*}"

cat "$input_file" |
    sed -E -n '/!\[.*\]\(.*\.(JPG|jpg|JPEG|jpeg|PNG|png)\)/p' |
    sed -E 's/^.*!\[.*\]\((.*?)\).*$/\1/' |
    sed s@^@$input_file_dir/@ |
    xargs -n1 ./conv_to_eps.bash

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
                sed -E 's/^#//' |
                sed -E 's/!\[(.*?)\]\((.*?)\.(JPG|jpg|JPEG|jpeg|png|PNG)\)/![\1](\2.eps)/g'
        fi
    done
}

output_dir="${2:-.}"
input_file="${1:?No input file}"
input_file_name="${input_file##*/}"
input_file_name_without_extension="${input_file_name%.*}"

make_header "$input_file" | pandoc --data-dir=. -s -f markdown-auto_identifiers -t latex -o "$output_dir/$input_file_name_without_extension.tex"

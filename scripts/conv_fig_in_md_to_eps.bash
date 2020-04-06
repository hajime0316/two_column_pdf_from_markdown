#!/bin/bash

input_file="${1:?No input file}"
if [[ ! $input_file =~ ^(/|./) ]]; then
    input_file="./$input_file"
fi

input_file_dir="${input_file%/*}"

cat "$input_file" |
    sed -E -n '/!\[.*\]\(.*\.(JPG|jpg|JPEG|jpeg|PNG|png)\)/p' |
    sed -E 's/^.*!\[.*\]\((.*?)\).*$/\1/' |
    while read line; do
        figure_file=$line
        if [[ ! $figure_file =~ ^(/|./) ]]; then
            figure_file="./$figure_file"
        fi
        figure_file_dir="${figure_file%/*}"
        output_dir="${2:-$input_file_dir}"

        conv_to_eps.bash "${input_file_dir%/}/${figure_file#\./}" "${output_dir%/}${figure_file_dir#\.}"
    done

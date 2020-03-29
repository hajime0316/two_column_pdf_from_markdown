#!/bin/bash

input_file="${1:?No input file}"
if [[ ! $input_file =~ / ]]; then
    input_file="./$input_file"
fi
input_file_dir="${input_file%/*}"
input_file_name="${input_file##*/}"
input_file_name_without_extension="${input_file_name%.*}"

output_file_dir="${2:-$input_file_dir}"
output_file="$output_file_dir/$input_file_name_without_extension.eps"

echo "$output_file"
bmeps -c "$input_file" "$output_file"

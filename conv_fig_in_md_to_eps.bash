#!/bin/bash

# .mdファイルをスクレイピングして
# 変換すべきファイルのPATHを取得

scrape_fig_in_md() {
    local input_file="${1:?No input file}"
    cat "$input_file" | sed -E -n '/!\[.*\]\(.*\.(JPG|jpg|JPEG|jpeg|PNG|png)\)/p' | sed -E 's/^.*!\[.*\]\((.*?)\).*$/\1/'
}

# bmepsコマンドで画像をepsに変換
# 引数は1つ（file）
# 入力ファイル名に.epsを付けたものを
# 入力ファイルと同じdirに出力

conv_to_eps() {
    local input_file="${1:?No input file}"
    local input_file_without_extention="${input_file%.*}"

    bmeps -c "$input_file" "$input_file_without_extention.eps"
}

input_file="${1:?No input file}"
if [[ ! $input_file =~ ^\./.*$ ]]; then
    input_file="./$input_file"
fi

input_file_dir="${input_file%/*}"

scrape_fig_in_md "$input_file" | sed s@^@$input_file_dir/@ | xargs -n1 ./conv_to_eps.bash

#!/bin/bash

# .mdファイルをスクレイピングして
# 変換すべきファイルのPATHを取得

# bmepsコマンドで画像をepsに変換
# 引数は1つ（file）
# 入力ファイル名に.epsを付けたものを
# 入力ファイルと同じdirに出力

conv_to_eps() {
    input_file="${1:?No input file}"
    input_file_without_extention="${input_file%.*}"

    bmeps -c "$input_file" "$input_file_without_extention.eps"
}

conv_to_eps "$1"

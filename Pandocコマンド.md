# Pandocコマンド

```sh
pandoc --data-dir=. test2.md -s -f markdown-auto_identifiers -t latex -o test.tex
```

## オプションの説明

### -s

スタンドアロンモードで変換．
プリアンブル（`\documentclass`から`\begin{document}`まで）が付く．

### -f

fromオプション．変換元のファイル形式指定．`-auto_identifiers`はハイパーリンクの自動付加を禁止する．
`markdown-<拡張markdownのルール名>`とすることで，指定したPandocの拡張markdownのルールを無効にできる．

### -t

toオプション．変換先のファイル形式指定．

### -o

アウトプットファイルのファイル名を指定する．

## 画像ファイルの変換

### bmeps

- http://technique.sonots.com/?UNIX%2F%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%2F%E5%A4%89%E6%8F%9B%2Fbmeps%20-%20%E7%94%BB%E5%83%8F%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E9%AB%98%E5%93%81%E8%B3%AA%E3%81%AAeps%E3%81%AB%E5%A4%89%E6%8F%9B

### imagemagick

- https://imagemagick.org/script/download.php

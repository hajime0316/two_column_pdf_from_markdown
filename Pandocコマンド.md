# Pandocコマンド

```sh
pandoc test2.md -s -f markdown-auto_identifiers -t latex -o test.tex
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

# Two Column Pdf from Markdown

Markdownを2段組みPDFに変換することができるVS Codeのワークスペース．

## 動作環境

OSはWindows 10を対象とする．

## 依存ソフトウェア

これはVS Codeのワークスペースであるため，この機能を使うためにはVS Codeが必要である．
また，このワークスペースは以下のソフトウェアに依存している．
使用の前に，以下のソフトウェアをインストールしておく必要がある（ソフトウェアの名前をクリックすると，そのインストーラのwebページに移動する）．

- [Git Bash (Git for Windows)](https://gitforwindows.org/)
- [W32TeX](https://www.ms.u-tokyo.ac.jp/~abenori/soft/abtexinst.html)
- [Adobe Acrobat Reader DC](https://get.adobe.com/jp/reader/)

## クイックスタート

### このワークスペースのクローン

```sh
git clone git@github.com:hajime0316/two_column_pdf_from_markdown.git
```

### ワークスペースをVS Codeで開く

VS Codeを起動し`ファイル`->`フォルダを開く`とクリックし，先ほどクローンしたフォルダを選択して`開く`をクリックする．

**注意**：`ファイル`->`ワークスペースを開く`ではない．

<!-- TODO: 図の挿入 -->

### サンプルのビルド

`20190510_研究報告資料（サンプル）`->`20190510_研究報告資料.md`とクリックして，サンプルのMarkdownファイルを開く．
サンプルのMarkdownファイルを開いた状態でショートカットキー「ctrl + shift + B」を押すと，そのMarkdownファイルがビルドされる．
`build`フォルダが作成され，その下に中間出力ファイルと最終的なPDFファイルが生成される．

### PDFの表示

Markdownファイルを開いた状態で，ショートカットキー「ctrl + shift + P」を押しコマンドパレットを出す．
コマンドパレットに「test task」と入力しエンターを押すと，Adobe Acrobat Reader DCが起動して先ほどビルドしたPDFファイルが表示される．

## 参考資料

### 使用しているPandocのコマンド

```sh
pandoc --template=latex/mytemplate.tex -s -f markdown-auto_identifiers -t latex -o "$output_dir/$input_file_name_without_extension.tex"
```

ただし，`$output_dir`はLaTeXファイルを出力するフォルダ名，`$input_file_name_without_extension`はMarkdownファイルの拡張子を除いた名前である．

#### オプションの説明

| オプション | 説明                                                                                                                                                                                                     |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -s         | スタンドアロンモードで変換．プリアンブル（`\documentclass`から`\begin{document}`まで）が付く．                                                                                                           |
| -f         | fromオプション．変換元のファイル形式指定．`-auto_identifiers`はハイパーリンクの自動付加を禁止する．`markdown-<拡張markdownのルール名>`とすることで，指定したPandocの拡張markdownのルールを無効にできる． |
| -t         | toオプション．変換先のファイル形式指                                                                                                                                                                     |
| -o         | アウトプットファイルのファイル名を指定する．                                                                                                                                                             |

### 画像ファイルの変換

Markdownで画像を扱う場合はPNGまたはJPGがよく，LaTeXで画像を扱う場合はEPSがよい．
そこで，ビルドの段階でPNGとJPGの画像をEPSに変換するという処理を行っている．
この変換処理には
[bmeps](
    http://technique.sonots.com/?UNIX%2F%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%2F%E5%A4%89%E6%8F%9B%2Fbmeps%20-%20%E7%94%BB%E5%83%8F%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E9%AB%98%E5%93%81%E8%B3%AA%E3%81%AAeps%E3%81%AB%E5%A4%89%E6%8F%9B
)
を用いている．

```sh
bmeps -c "$input_file" "$output_file"
```

### windowsにおけるbashからのPDFの表示

VS CodeからPDFを表示するために，テストタスクに以下のようなコマンドを登録している．
Adobe Acrobat Reader DCをコマンドラインから起動し，ビルドしたPDFを表示させる．

```sh
start AcroRd32; pdfopen.exe --file build/$fileBasenameNoExtension.pdf
```

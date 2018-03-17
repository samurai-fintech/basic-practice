# 概要

下記はコマンドの短縮説明があります。知らないコマンドをすぐ調べるためにいくつかのPDFを印刷したほうが良いです。

*  English
  *  [Cheat Sheet by Dave Child](https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/pdf/)
  *  [Another Cheat Sheet by FOSS](https://files.fosswire.com/2007/08/fwunixref.pdf)
  *  [Git Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
*  日本語
  *  [FOSSによりチートシート](http://www.yotabanana.com/misc/fwunixref_ja.pdf)
  *  [Gitチートシート](https://services.github.com/on-demand/downloads/ja/github-git-cheat-sheet.pdf)


# 簡単な練習

開発スペースを作りましょう。

自分のホームダイレクトリーの中身を見てみましょう。


```bash
cd $HOME
ls $HOME
```

ユーザ名とユーザIDも見てみましょう。

```bash
echo $USER
id -u $USER
```

開発するダイレクトリーを作りましょう。

```bash
export WORKDIR=$HOME/localwork
mkdir $WORKDIR
```


# Git

[Git](https://ja.wikipedia.org/wiki/git)はソースコードを管理するソフトです。


ソースコードを共有する有名な[Github.com](https://github.com)からコードをダインロードしてみましょう。

```bash
cd $WORKDIR
git clone https://github.com/samurai-fintech/basic-practice basic-practice
cd basic-practice
```

ソフトウェアの企画は普段に複数のバージョンがあります。Gitでバージョンを、ブランチというもので管理します。

```bash
git branch
git branch -r
```

自分のブランチを作りましょう。

```bash
git checkout -b my-branch
```

ダウンロードしたコードとちょっと変更してコミットしましょう。

```bash
touch hello-world.txt
git status
git add .
git status
git commit -m "my first commit"
git branch
git status
```

`git status`で現在チェックアウトされているコード状況を閲覧できます。



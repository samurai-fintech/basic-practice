# 基礎コース

目的はフィンテック用のソフト開発を練習することです。


簡単に開発環境を整うためにDockerコンテナーがたくさん活用されています。Mac・Linuxをご利用になっている方は簡単にインストールすることができますが、Windowsを持ちの方は安い仮想サーバーを借りたほうがおすすめです。

## 開発環境の準備

[このページになっています。](CheatSheet.ja.md)

# Bitcoinの練習

## 無料のテストコイン

テストするためにコインを取得しないといけませんので、下記のリンクにとんでもらいます。

[Hamburg Testnet Faucet](https://testnet.manu.backend.hamburg/faucet)

## Node.jsのビットコイン財布


Javascriptでビットコインを扱う練習です。


[これは練習のファイルです。](js/simple-spend.js).


Dockerコンテナーを作る手順は下記の通りです。:
1.  `docker build -t mynodejs:jessie --build-arg useruid=$(id -u $USER) -f docker/Dockerfile.js.amd64 .`
1.  `docker run -v $(pwd):/var/share/nodejs --name mynodejs.run -it mynodejs:jessie /bin/bash`
  * 実行する結果はBashになるはずです。
1. `cd js`
1. `npm install bitcoinjs-lib`
1. `node ./simple-spend.js`
  * javascriptのプログラムを実行する

## Perlのビットコイン財布

[上と同じようなプログラムです。](pl/simple-wallet.pl).



# Dockerのインストールについて

*  [For Mac](https://docs.docker.com/docker-for-mac/install/)
*  [For Debian/Ubuntu](https://docs.docker.com/install/linux/docker-ce/debian/)
*  [For Windows](https://docs.docker.com/docker-for-windows/install/) - 使い方は上と異なります。ご注意ください。

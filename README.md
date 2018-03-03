# Basic Practice

The purpose of this document is to get people up to speed on compiling fintech related software.

For other languages, see:
*  [日本語](README.ja.md)


To avoid messing up the development environment, Docker is used frequently to contain all the working code.  It is highly recommended that you become familiar with how Docker works.  If you have a Linux and/or Mac OS, then it will be easy to set up.  If you have Windows, it is recommended that you spend money (10 USD/month) on a remote server.  It is the same price as 2 cocktails at Starbucks.


## Node.js BTC Wallet


Practice handling Bitcoin with Javascript.

The practice file is [here](js/simple-spend.js).


To create the docker image and container for doing node js work:
1.  `docker build -t mynodejs:jessie --build-arg useruid=$(id -u $USER) -f docker/Dockerfile.js.amd64 .`
1.  `docker run -v $(pwd):/var/share/nodejs --name mynodejs.run -it mynodejs:jessie /bin/bash`
  * with this command, you will end up in a bash shell in which you can execute commands
1. `cd js`
1. `npm install bitcoinjs-lib`
1. `node ./simple-spend.js`
  * this will run the javascript program

## Perl BTC Wallet

For Perl, we have [a simple program for transactions set up](pl/simple-wallet.pl).

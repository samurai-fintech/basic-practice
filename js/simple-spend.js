/*
 *  このプログラムの目的は、手動でビットコインを送金することです。
 * This program lets you spend bitcoin on the test net.
 * 
 *
 */



// https://github.com/bitcoinjs/bitcoinjs-lib 
var bitcoin = require('bitcoinjs-lib');
var mynetwork = bitcoin.networks.testnet; // 本物のお金の場合はlivenetにする For real money, use "livenet"

/*
 * 新しい秘密鍵を作ってWIFとして出力する
 * Create a private key  and address
*/
var myWIF = bitcoin.ECPair.makeRandom({ network: mynetwork }).toWIF();
console.log('My super secret private key='+myWIF);
var keyPair = bitcoin.ECPair.fromWIF(myWIF,mynetwork);
var address = keyPair.getAddress();
console.log('My public, shareable address='+address);


/*
 * 下記のコードに適用な変数を設定しないといけない。
 *　You have to fill in the values below.
*/

var privkey = 'WIFPRIVATEKEY';
var addrPre = 'ADDRESSFORPRIVATEKEY';
var toAddr = 'DESTADDR';
var currentBalance = 'PRIVKEYBALANCE' ;
// 現在の手数料をこのサイトから見ました。
//  https://bitcoinfees.21.co/api/v1/fees/recommended
var fee = 225 * 100;
var toValue = currentBalance - fee;

console.log("fee="+fee+"\n");

var txid = 'INPUTTXID';
var vout = 'INPUTVOUT';

// 秘密鍵を組み立つ
var keyPair = bitcoin.ECPair.fromWIF(privkey, bitcoin.networks.livenet);

var txb = new bitcoin.TransactionBuilder(bitcoin.networks.livenet);
// 秘密鍵に対する残高を増やした取引記録のIDを追加する
txb.addInput(txid, vout);
// 支払い先を取引記録に追加する
txb.addOutput(toAddr, toValue);

// 秘密鍵で署名付けをする
txb.sign(0, keyPair);

console.log(txb.build().toHex());

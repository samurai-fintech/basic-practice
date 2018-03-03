 
var bitcoin = require('bitcoinjs-lib');

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

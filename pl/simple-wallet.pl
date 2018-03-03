#!/usr/bin/perl -wT

use strict;
use warnings;

# Always import CBitcoin first, or else the C files will not load and the program will break.
use CBitcoin;


use CBitcoin::CBHD;
use CBitcoin::TransactionInput;
use CBitcoin::TransactionOutput;
use CBitcoin::Transaction;

use JSON::XS;
use Test::More tests => 3;

# For now, both the Chain (legacy vs uahf) and network (livenet vs testnet) are set via global variables.
# ..The thinking at the time was that people should not be mixing money types in the same process.

$CBitcoin::network_bytes = TESTNET;

my $root = CBitcoin::CBHD->generate("for doing a test. 60163bdd79e0b67b33eb07dd941af5dfd9ca79b85866c9d69993d95488e71f2d");

sub doTx{
	# got these from a block explorer, but we have to reverse the bytes
	my @hashes = (
		'6105e342232a9e67e4fa4ee0651eb8efd146dc0d7d346c788f45d8ad591c4577',
		'da16a3ea5101e9f2ff975ec67a4ad85767dd306c27b94ef52500c26bc88af5c9'
	);
	
	@ins = (
		# mwUaFw3zQ8M4iaeuhFiiGWy4QbTphAeSxh 0.01394
		CBitcoin::TransactionInput->new({
			'prevOutHash' => pack('H*',join('',reverse($hashes[0] =~ m/([[:xdigit:]]{2})/g) )  ) #should be 32 byte hash
			,'prevOutIndex' => 1
			,'script' =>  CBitcoin::Script::address_to_script($root->deriveChild(1,1)->address()) # scriptPubKey
		}),
		# ms2Kt13CEL5jTMs98qXMAD15WpmnsK5ZGg 0.01408
		CBitcoin::TransactionInput->new({
			'prevOutHash' => pack('H*',join('',reverse($hashes[1] =~ m/([[:xdigit:]]{2})/g) ) ) #should be 32 byte hash
			,'prevOutIndex' => 1
			,'script' =>  CBitcoin::Script::address_to_script($root->deriveChild(1,2)->address()) # scriptPubKey
		})	
	);
	my $balance = int( (0.01394 + 0.01408) * 100_000_000);
	my $fee = int(0.0001 * 100_000_000);
	
	warn "Address for m:".$root->export_xpriv()."\n";
	warn "Address for m:".$root->deriveChild(1,1)->address()."\n";
	warn "Address:".$root->deriveChild(1,2)->address()."\n";
	warn "Address:".$root->deriveChild(1,3)->address()."\n";
	
	@outs = (CBitcoin::TransactionOutput->new({
		'script' => CBitcoin::Script::address_to_script($root->deriveChild(1,3)->address())
		,'value' => ($balance - $fee)
	}));
	
	# mi5W6CfThYwzTDsJg8Swu223dmyPPXDc8w
	# mi5W6CfThYwzTDsJg8Swu223dmyPPXDc8w
	
	my $tx = CBitcoin::Transaction->new({
		'inputs' => \@ins, 'outputs' => \@outs
	});
	
	my $txdata = $tx->assemble_p2pkh(0,$root->deriveChild(1,1));
	warn "Txdata:".unpack('H*',$txdata)."\n";
	$txdata = $tx->assemble_p2pkh(1,$root->deriveChild(1,2),$txdata);
	
	warn "TX:".unpack('H*',$txdata )."\n";
	#ok($tx->validate_sigs($txdata),'good tx on signed tx');
	#ok(1,'good tx (validate sigs not yet implemented)');
}
doTx();















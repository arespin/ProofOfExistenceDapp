pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PoExistence.sol";


contract TestPoExistence{


	function testUploadReturns() {
	    PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

	    string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 expected = 0x516d566b4d6374636332504b3678314a7a697458764168335658464a6a48334c;

	    Assert.equal(poe.upload(ipfshash), expected, "The current account should be uploading to the abbreviated hash");
  }


  function testDatahash_Metadata() {
  	PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  	string memory ipfshash = "QmbhJgP7fRJPjshC8uAsG59tSF9Snocj8BjdJqZGjHbKQC";
  	poe.upload(ipfshash);


   	bytes32 datahash = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;


    Assert.isAtMost(poe.datahash_metadata(datahash), block.number, "The proof of existence should return the block number, which is less than or equal to the current block number");
  }

  function testStringToBytes32(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  		string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 expected = 0x516d566b4d6374636332504b3678314a7a697458764168335658464a6a48334c;

	    Assert.equal(poe.stringToBytes32(ipfshash), expected, "The current ipfshash should convert from base58 to lossy bytes32");

  }

  function testProofOfExistence(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  		string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 datahash = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;

	    Assert.isAtMost(poe.proofOfExistence(datahash), block.number, "The current ipfshash should convert from base58 to lossy bytes32");

  }

  function testUsers_Datahash(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());
  		bytes32 expected = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;
  		Assert.equal(poe.users_datahash(this), expected, "The current ipfshash should convert from base58 to lossy bytes32");
  }

}
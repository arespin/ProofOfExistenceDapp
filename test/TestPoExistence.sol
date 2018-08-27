pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PoExistence.sol";


contract TestPoExistence{

  //this test was written to make sure that the upload function is using the correct byte32 translation as a key to modify the contract storage
	function testUploadReturns() {
	    PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

	    string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 expected = 0x516d566b4d6374636332504b3678314a7a697458764168335658464a6a48334c;

	    Assert.equal(poe.upload(ipfshash), expected, "The current account should be uploading to the abbreviated hash");
  }

  //this test was written to make sure that the datahash_metadata state variable has correctly been updated with a blockNumber
  //it is impossible to predict the exactly correct blockNumber, but was is most important to my contract functionality is that the blockNumber is at most the current blockNumber
  function testDatahash_Metadata() {
  	PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  	string memory ipfshash = "QmbhJgP7fRJPjshC8uAsG59tSF9Snocj8BjdJqZGjHbKQC";
  	poe.upload(ipfshash);


   	bytes32 datahash = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;


    Assert.isAtMost(poe.datahash_metadata(datahash), block.number, "The proof of existence should return the block number, which is less than or equal to the current block number");
  }

  //This test is to make sure that the ipfshash that ipfs returns is being correctly translated to bytes32 by the stringToBytes32 function
  function testStringToBytes32(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  		string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 expected = 0x516d566b4d6374636332504b3678314a7a697458764168335658464a6a48334c;

	    Assert.equal(poe.stringToBytes32(ipfshash), expected, "The current ipfshash should convert from base58 to lossy bytes32");

  }

  //this test is to insure that the proofOfExistence function returns a blockNumber from the past. This is another instance where it is impossible to predict the exact blockNumber and make an exact assertion
  function testProofOfExistence(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());

  		string memory ipfshash = "QmVkMctcc2PK6x1JzitXvAh3VXFJjH3LqTyyKuoPZKmh4g";
	    bytes32 datahash = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;

	    Assert.isAtMost(poe.proofOfExistence(datahash), block.number, "The current ipfshash should convert from base58 to lossy bytes32");

  }

  // this function ensures that the users_datahash state variable is correctly updated with the byte32 translation of the ipfshash, which is returned by stringToBytes32
  function testUsers_Datahash(){
  		PoExistence poe = PoExistence(DeployedAddresses.PoExistence());
  		bytes32 expected = 0x516d62684a67503766524a506a7368433875417347353974534639536e6f636a;
  		Assert.equal(poe.users_datahash(this), expected, "This current address has the incorrect ipfshash byte32 translation");
  }

}
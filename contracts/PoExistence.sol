pragma solidity ^0.4.17;

//this is an example of an imported ethPM package
import "../installed_contracts/bytes/contracts/BytesLib.sol";

//@title PoExistence
contract PoExistence {
    /* maps the user who uploaded data to proved existed to that data's hash they uploaded, only 1 address maps to 1 data hash so as to avoid overflow attacks*/
    mapping(address => bytes32) public users_datahash;
    
    /* maps the hashed data to the user who uploaded that data*/
    mapping(bytes32 => address) public datahash_to_user;
    
    /* maps the hash of the data to its blocknumber*/
    mapping(bytes32 => uint) public datahash_metadata;
    

    bool private stopped = false;
    modifier circuitBreaker{
    	require(!stopped);
    	_;
    }

    event LogUpload(bytes32 datahash, uint blockNumber);
    event ExistenceProof(bytes32 datahash, uint blockNumber);


    //https://ethereum.stackexchange.com/questions/9142/how-to-convert-a-string-to-bytes32
    //@notice convert a string to bytes32 this is not a direct translation since there can be different string encodings, it is merely to make the key for our mappings
    //@returns return the bytes32 translation of the input string
    function stringToBytes32(string memory source) pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        require(tempEmptyStringTest.length < 50);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

    //@notice upload the ipfs hash key to the blockchain, someone who has the ipfshash will be able to use stringToBytes32 and proove that they uploaded that file
    //@returns the bytes32 translation of the input string, which is used as the key to our blockchain storage
    //@param ipfshash the returned hash of a file that the msg.sender uploaded
    function upload(string ipfshash) public circuitBreaker()  returns (bytes32){
        bytes32 datahash = stringToBytes32(ipfshash);

    	// check that the datahash was set to a user address, if it already was then reject this attempt
        require(datahash_to_user[datahash] == 0);


    	datahash_to_user[datahash] = msg.sender;
    	datahash_metadata[datahash] = block.number;
        users_datahash[msg.sender] = datahash;

    	emit LogUpload(datahash, block.number);
        return datahash;
    }

    //@notice prooves that the file corresponding to the input datahash was uploaded at the given block number
    //@param datahash the bytes32 representation of the ipfshash returned from a given file being uploaded
    //@return the block number that the datahash of the file was uploaded into
    function proofOfExistence(bytes32 datahash) constant public returns(uint) {
    		emit ExistenceProof(datahash, datahash_metadata[datahash]);
            uint blockNumber = datahash_metadata[datahash];

            //if blockNumber is greater than the current block.number it must be the case that our proof of past existence is compromised since no one can tell the future
            if(blockNumber > block.number){
                stopped = true;
            }
    		return blockNumber;
    }
}
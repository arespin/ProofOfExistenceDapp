My project is a simple Proof of Existence Dapp. The main contract is PoExistence.sol. A user can upload their file using the React UI to IPFS and my PoExistence contract will upload a lossy hash of the ipfs hash to its storage. A user can simply call stringToBytes32 with their ipfs hash as input and use the resultant lossy hash output, which I named datahash, to prove that they uploaded the file for a given block number. I used:https://itnext.io/build-a-simple-ethereum-interplanetary-file-system-ipfs-react-js-dapp-23ff4914ce4e to help me with some boiler plate code in order to integrate with IPFS since the lectures did not have a deep dive tutorial like for the other tools. 

To set this project up locally, react, react-bootstrap, npm/Node.js, Metamask, web3, ganache-cli and ipfs-api must all be installed. Run ganache-cli from the command line. The ganache development network should be running on localhost at port 8545. Connect Metamask to this locally running blockchain by using the mnemonic that ganache-cli outputs as the seed. 

In the main ProofOfExistenceDapp directory, run: 

truffle compile
truffle migrate

The file eth-ipfs/src/poehash.js needs to be modified based on the artifacts and address that the contract gets deployed to. address should be set to the new address that the contract is deployed to (which should be output from truffle migrate). The abi variable should be set to whatever the property "abi" is set to in the file ProofOfExistenceDapp/build/contracts/PoExistence.json

Once this is done, save poehash.js with the newly set abi and address variables.

In another command-line tab, navigate to the eth-ipfs directory. and run the command:

npm start

You should now be able to navigate to localhost:3000 in your browser to see the UI interface. Choose a small picture file to upload with the "Choose File" button, and then click the "Send it" button. You will be prompted to sign the transaction with Metamask. If you submit, then you will be able to see a transaction receipt by clicking on the corresponding button. The Block Number and Gas Used fields can sometimes take a while to load because of the React state populating.

You can also run truffle test from the ProofOfExistenceDapp directory in order to see the tests corresponding to my smart contract.

An example of how to import an ethPM package can be seen in PoExistence.sol line 4.  
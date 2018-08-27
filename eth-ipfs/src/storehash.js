import web3 from './web3';
//access our local copy to contract deployed on rinkeby testnet
//use your own contract address

const address = '0x6a8f7743423a8ad0697cc61fbe2964d2720da015';

const abi = [
    {
      "constant": false,
      "inputs": [
        {
          "name": "x",
          "type": "string"
        }
      ],
      "name": "sendHash",
      "outputs": [],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [],
      "name": "getHash",
      "outputs": [
        {
          "name": "x",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    }
  ]

  export default new web3.eth.Contract(abi, address);
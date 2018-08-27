import web3 from './web3';
//access our local copy to contract deployed on rinkeby testnet
//use your own contract address

const address = '0xa3252407781e6d35c26afd98927ef098dcc0b08e';

const abi =  [
    {
      "constant": true,
      "inputs": [
        {
          "name": "",
          "type": "address"
        }
      ],
      "name": "users_datahash",
      "outputs": [
        {
          "name": "",
          "type": "bytes32"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "",
          "type": "bytes32"
        }
      ],
      "name": "datahash_metadata",
      "outputs": [
        {
          "name": "",
          "type": "uint256"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "",
          "type": "bytes32"
        }
      ],
      "name": "datahash_to_user",
      "outputs": [
        {
          "name": "",
          "type": "address"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "name": "datahash",
          "type": "bytes32"
        },
        {
          "indexed": false,
          "name": "blockNumber",
          "type": "uint256"
        }
      ],
      "name": "LogUpload",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "name": "datahash",
          "type": "bytes32"
        },
        {
          "indexed": false,
          "name": "blockNumber",
          "type": "uint256"
        }
      ],
      "name": "ExistenceProof",
      "type": "event"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "source",
          "type": "string"
        }
      ],
      "name": "stringToBytes32",
      "outputs": [
        {
          "name": "result",
          "type": "bytes32"
        }
      ],
      "payable": false,
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "ipfshash",
          "type": "string"
        }
      ],
      "name": "upload",
      "outputs": [
        {
          "name": "",
          "type": "bytes32"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": true,
      "inputs": [
        {
          "name": "datahash",
          "type": "bytes32"
        }
      ],
      "name": "proofOfExistence",
      "outputs": [
        {
          "name": "",
          "type": "uint256"
        }
      ],
      "payable": false,
      "stateMutability": "view",
      "type": "function"
    }
  ]

export default new web3.eth.Contract(abi, address);
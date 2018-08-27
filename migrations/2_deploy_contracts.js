var PoExistence = artifacts.require("./PoExistence.sol");
var IPFS_Test = artifacts.require("./IPFS_Test.sol");

module.exports = function(deployer) {
  deployer.deploy(PoExistence);
  deployer.link(PoExistence, IPFS_Test);
  deployer.deploy(IPFS_Test);
};

const ERC20 = artifacts.require('ERC20');
const Theter = artifacts.require('Theter');

module.exports = function(deployer) {
    deployer.deploy(ERC20);
    deployer.link(ERC20, Theter);
    deployer.deploy(Theter);
};
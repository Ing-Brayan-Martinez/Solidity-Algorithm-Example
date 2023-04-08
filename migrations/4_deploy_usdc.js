const ERC20 = artifacts.require('ERC20');
const USDC = artifacts.require('USDC');

module.exports = function(deployer) {
    deployer.deploy(ERC20);
    deployer.link(ERC20, USDC);
    deployer.deploy(USDC);
};
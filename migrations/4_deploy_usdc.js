const USDC = artifacts.require('USDC');

module.exports = function(deployer) {
    deployer.deploy(USDC);
};
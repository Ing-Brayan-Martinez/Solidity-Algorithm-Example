const Avalanche = artifacts.require('Avalanche');

module.exports = function(deployer) {
    deployer.deploy(Avalanche);
};
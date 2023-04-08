const ERC20 = artifacts.require('ERC20');
const Avalanche = artifacts.require('Avalance');

module.exports = function(deployer) {
    deployer.deploy(ERC20);
    deployer.link(ERC20, Avalanche);
    deployer.deploy(Avalanche);
};
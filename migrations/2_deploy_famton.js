const ERC20 = artifacts.require('ERC20');
const Famton = artifacts.require('Famton');

module.exports = function(deployer) {
    deployer.deploy(ERC20);
    deployer.link(ERC20, Famton);
    deployer.deploy(Famton);
};
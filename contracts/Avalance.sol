// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;


import "./ERC20.sol";



contract Avalance is ERC20 {
    string public name = "Avalanche Token";
    string public symbol = "AVAX";
    uint8 public decimals = 18;
    uint256 public myTotalSupply;

    mapping(address => uint256) public myBalanceOf;
    mapping(address => mapping(address => uint256)) public myAllowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        myTotalSupply = 21000000;
        myBalanceOf[msg.sender] = myTotalSupply;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        myAllowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(myBalanceOf[msg.sender] >= _value);
        myBalanceOf[msg.sender] -= _value;
        myBalanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(myBalanceOf[_from] >= _value);
        require(myAllowance[_from][msg.sender] >= _value);
        myBalanceOf[_from] -= _value;
        myBalanceOf[_to] += _value;
        myAllowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function totalSupply() public view override returns (uint256) {
        return myTotalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return myBalanceOf[account];
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return myAllowance[owner][spender];
    }
}

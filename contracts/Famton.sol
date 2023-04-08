// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;


import "./ERC20.sol";



contract Famton is ERC20 {
    string public name = "Famton";
    string public symbol = "FTM";
    uint8 public decimals = 18;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        _totalSupply = 21000000;
        _balances[msg.sender] = _totalSupply;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(_balances[_from] >= _value);
        require(_allowance[_from][msg.sender] >= _value);
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowance[owner][spender];
    }
}

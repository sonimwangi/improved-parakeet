// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract SonnyToken {
    IERC20 public sonnies;
    constructor(address _sonnyt) {
        sonnies = IERC20(_sonnyt);
    }
    function getUSDTBalance(address account) public view returns (uint256) {
        return sonnies.balanceOf(account);
    }
    function transferUSDT(address recipient, uint256 amount) public returns (bool) {
        require(sonnies.transfer(recipient, amount), "Transfer failed");
        return true;
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    address public owner;
    uint256 public number;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
	require(msg.sender == owner, "Hey!You are not the Owner");
	_;
    }

    function setNumber(uint256 newNumber) public {
        require(msg.sender == owner, "Hey!You are not the Owner");
        number = newNumber;
    }

    function increment() public onlyOwner{
        number++;
    }
}

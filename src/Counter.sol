// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    address public owner;
    uint256 public number;
    constructor () {
        owner= msg.sender;
    }
    function setNumber(uint256 newNumber) public {
        require(msg.sender==owner ,"Hey!You are not the Owner");
        number=newNumber;
    }

    function increment() public {
        number++;
    }
}

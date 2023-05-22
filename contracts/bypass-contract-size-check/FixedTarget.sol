// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Target {
    bool public doSomethingDangerous = false;

    function protected() external {
        require(tx.origin == msg.sender, "no contract allowed");
        doSomethingDangerous = true;
    }
}

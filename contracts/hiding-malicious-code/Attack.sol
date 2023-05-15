// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Attack {
    event Log(string message);

    function log() public {
        emit Log("Attack was called!");
    }
}
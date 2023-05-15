// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bar {
    event Log(string message);

    function log() public {
        emit Log("Bar was called");
    }
}

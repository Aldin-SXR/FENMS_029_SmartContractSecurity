// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Lib {
    address public owner;

    function changeOwner() public {
        owner = msg.sender;
    }
}
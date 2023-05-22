// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Target {
    function isContract(address account) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    bool public doSomethingDangerous = false;

    function protected() external {
        require(!isContract(msg.sender), "no contract allowed");
        doSomethingDangerous = true;
    }
}

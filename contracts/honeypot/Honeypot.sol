// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// The code is in a separate contract not visible to the attacker
contract HoneyPot {
    function log(address _caller, uint _amount, string memory _action) public {
        if (equal(_action, "Withdraw")) {
            revert("It's a trap!");
        }
    }

    // Function to compare strings using keccak256
    function equal(string memory _a, string memory _b) public pure returns (bool) {
        return keccak256(abi.encode(_a)) == keccak256(abi.encode(_b));
    }
}
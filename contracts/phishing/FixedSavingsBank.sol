// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SavingsBank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        // to receive ether.
    }

    function withdrawAll(address _recipient) public {
        // Use msg.sender instead of tx.origin
        require(msg.sender == owner);
        (bool sent, ) = _recipient.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
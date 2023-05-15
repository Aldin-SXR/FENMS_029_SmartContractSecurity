// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract UserInfo {
    string public Name = "Alice";           // slot 0
    string private Address = "Metaverse";   // slot 1
    uint public Age = 22;                   // slot 2
    string public Gender = "Female";        // slot 3
    uint private credit_card;               // slot 4

    bool public pwned;

    constructor(uint _credit_card) {
        credit_card = _credit_card;
    }

    function pwn(uint _credit_card) public {
        require(_credit_card == credit_card);
        pwned = true;
    }

    function resetPwn() public {
        pwned = false;
    }
}

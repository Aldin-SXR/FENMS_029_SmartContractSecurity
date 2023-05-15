// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

abstract contract ReentrancyGuard {
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
}

contract FixedAuction is ReentrancyGuard {
    address frontRunner;
    uint256 highestBid;
    mapping(address => uint) public balances;

    function bid() public payable {
        require(msg.value > highestBid, "Need to be higher than highest bid");

        // update previous bidder info
        balances[frontRunner] += highestBid;

        // update new bidder
        frontRunner = msg.sender;
        highestBid = msg.value;
    }

    function withdraw() public noReentrant {
        require(
            msg.sender != frontRunner,
            "Current frontRunner cannot withdraw"
        );

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
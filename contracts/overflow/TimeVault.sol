// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

contract TimeVault {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    function deposit(uint256 _depositAmount) external payable {
        balances[msg.sender] += _depositAmount;
        lockTime[msg.sender] = block.timestamp + 7 days;
    }

    function increaseLockTime(uint256 _timeinsecond) external {
        lockTime[msg.sender] = lockTime[msg.sender] + _timeinsecond;
    }

    function transferFunds(address _to, uint256 _amount) external {
        require(balances[msg.sender] > _amount, "Insufficient funds!");
        require(
            block.timestamp > lockTime[msg.sender],
            "Lock time not expired!"
        );
        balances[_to] += _amount;
        balances[msg.sender] -= _amount;
    }
}

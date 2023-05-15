pragma solidity ^0.8.9;

abstract contract ReentrancyGuard {
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
}

contract InsecureEtherVault is ReentrancyGuard {
    mapping(address => uint256) private userBalances;

    function deposit() external payable {
        userBalances[msg.sender] += msg.value;
    }

    function withdrawAll() external noReentrant {
        uint256 balance = getUserBalance(msg.sender);
        require(balance > 0, "Insufficient balance.");

        // First update the balance, then send funds.
        userBalances[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: balance}("");
        
        require(success, "Failed to send Ether.");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getUserBalance(address _user) public view returns (uint256) {
        return userBalances[_user];
    }
}

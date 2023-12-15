// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
 
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Variables {
    string public text = "Hello";
    uint public num = 123;
    
    function doSomething() public view {
        // Local variables aren ot saved to the blockchain
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp;  // Current block timestamp
        address sender = msg.sender;       // address of the caller

    }

}
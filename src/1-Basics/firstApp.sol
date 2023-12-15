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

contract firstApp {
    uint public count = 0;

    // Function to get the current count 
    function get() public view returns(uint) {
        return count;
    }

    // Function to increment count by 1 
    function inc() public {
        count+=1;
    }

    // Function to decrement count by 1
    function dec() public {
        // This function will fail if count = 0;
        count -=1;
    }
}
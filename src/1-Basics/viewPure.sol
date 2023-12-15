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

contract ViewAndPure {
    uint public x = 1;

    // Promise not to modify the state
    function addToX(uint y) public view returns (uint) {
        return x+y;
    }

    //Promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i+j;
    }
}
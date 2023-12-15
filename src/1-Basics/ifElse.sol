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

contract IfElse {
    function foo(uint x) public pure returns(uint) {
        if(x<10) return 0;
        else if (x<20) return 1;
        else return 2;
    }
    function ternary(uint _x) public pure returns(uint) {
        if(_x < 20) {
            return 1;
        }
        return 2;

        return _x < 10 ? 1 : 2;
    }
}
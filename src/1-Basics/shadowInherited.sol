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

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6 This will not compile
// contract B is A {
// constructor() {
//     name = "Contract C";
// }
// }

contract C is A {
    // This is the correct way to override inherited state variables
    constructor() {
        name = "Contract C";
    }

    // C.getName() returns "Contract C"

}
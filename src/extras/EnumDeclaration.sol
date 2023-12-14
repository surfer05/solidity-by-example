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

enum Status_2 {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}
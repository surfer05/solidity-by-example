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

contract dataTypes {
    bool public boo = true;

    uint8 public u8 = 1;
    int8 public i8 = -1;

    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    
    address public addr = 0xcEC049E650266251c3d4206cf21E11a6A61Edc2A;

    // The term bytes in Solidity represents a dynamic array of bytes
    // It's a shorthand for byte[]
    bytes1 a = 0xb5;  //[10110101]
    bytes2 b = 0xaaaa; //[10101010 10101010]

    // Unassignes variables have a default value 
    bool public defaultBoo; //false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
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
pragma solidity ^0.8.19;

contract Base {
    // Private function can only be called 
    // - inside this contract
    // Contracts that inherit this contract cannot call this function
    function privateFunc() private pure returns (string memory){
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory){
        return privateFunc();
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    function internalFunc() internal pure returns(string memory){
        return "internal function called";
    }

    function testInternalFunc() internal pure virtual returns(string memory){
        return internalFunc();
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns(string memory){
        return "public function called";
    }

    // External functions can only be called
    // - by other contracts and accounts
    function externalFunc() external pure returns (string memory){
        return "external function called";
    }

    // This function will not compile since we're trying to call and external function here.
    // function testExternalFunc() public pure returns (string memory){
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variables";
    string public publicVar = "my public variable";

    // State variables cannot be external so this code won't compile
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Inherited contracts do not have access to private functions and state variables
    // function testPrivateFunc() public pure returns (string memory){
            // return privateFunc();
    // }

    // INternal function can be called inside child contracts
    function testInternalFunc() internal pure override returns (string memory){
        return internalFunc();
    }
}
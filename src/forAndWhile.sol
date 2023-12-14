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

contract ForAndWhile {
    function loop() public {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) continue;
            if (i == 5) break;
        }
        uint j;
        while (j < 10) {
            j++;
        }
    }
}



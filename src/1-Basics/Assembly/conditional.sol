// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract AssemblyIf {
    function yul_if(uint x) public pure returns (uint z) {
        assembly {
            // if condtion =1 {code}
            // no else
            // if 0 {z :=99}
            // if 1 {z := 99}
            if lt(x, 10) {
                z := 99
            }
        }
    }

    function yul_switch(uint x) public pure returns (uint z) {
        assembly {
            switch x
            case 1 {
                z := 10
            }
            case 2 {
                z := 20
            }
            case 3 {
                z := 30
            }
        }
    }
}

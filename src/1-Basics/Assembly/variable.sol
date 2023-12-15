
 
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract AssemblyVariable {
    function yul_let() public pure returns (uint z){
        assembly {
            // Language used for assembly is called Yul
            // Local Variables
            let x := 123
            z:= 456
        }
    }
}
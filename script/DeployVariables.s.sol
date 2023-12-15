// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Variables} from "../src/1-Basics/Variables.sol";

contract DeployVariables is Script {
    function run() external returns(Variables) {
        vm.startBroadcast();
        Variables variables = new Variables();
        vm.stopBroadcast();
        return variables;
    }
}
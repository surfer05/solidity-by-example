// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {dataTypes} from "../src/1-Basics/dataTypes.sol";

contract DeployDataTypes is Script {
    function run() external returns (dataTypes) {
        vm.startBroadcast();   
        dataTypes dT = new dataTypes(); 
        vm.stopBroadcast();
        return dT;
    }
}
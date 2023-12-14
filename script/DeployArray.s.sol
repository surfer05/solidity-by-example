// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Array} from "../src/array.sol";

contract DeployArray is Script {

    function run() external returns (Array) {
        vm.startBroadcast();
        Array arr = new Array();
        vm.stopBroadcast();
        return arr;
    }
}
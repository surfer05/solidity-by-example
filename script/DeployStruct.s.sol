// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Structs} from "../src/1-Basics/struct.sol";

contract DeployStruct is Script {

    function run() external returns (Structs) {
        vm.startBroadcast();
        Structs str = new Structs();
        vm.stopBroadcast();
        return str;
    }
}
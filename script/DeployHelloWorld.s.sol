// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {HelloWorld} from "../src/1-Basics/HelloWorld.sol";

contract DeployHelloWorld is Script {
    function run() external returns(HelloWorld) {
        vm.startBroadcast();
        HelloWorld helloWorld = new HelloWorld();
        vm.stopBroadcast();
        return helloWorld;
    }
}
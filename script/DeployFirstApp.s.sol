// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {firstApp} from "../src/firstApp.sol";

contract DeployFirstApp is Script {
    function run() external returns(firstApp) {
        vm.startBroadcast();
        firstApp app = new firstApp();
        vm.stopBroadcast();
        return app;
    }
}
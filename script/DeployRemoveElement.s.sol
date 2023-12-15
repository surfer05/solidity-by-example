// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {RemoveElement} from "../src/1-Basics/removeArrayElement.sol";

contract DeployRemoveElement is Script {

    function run() external returns (RemoveElement) {
        vm.startBroadcast();
        RemoveElement remove = new RemoveElement();
        vm.stopBroadcast();
        return remove;
    }
}
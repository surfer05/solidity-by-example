// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {ForAndWhile} from "../src/1-Basics/forAndWhile.sol";

contract DeployForAndWhile is Script {

    function run() external returns (ForAndWhile) {
        vm.startBroadcast();
        ForAndWhile forAndWhile = new ForAndWhile();
        vm.stopBroadcast();
        return forAndWhile;
    }
}
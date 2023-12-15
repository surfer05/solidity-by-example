// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {IfElse} from "../src/1-Basics/ifElse.sol";

contract DeployIfElse is Script {

    function run() external returns (IfElse) {
        vm.startBroadcast();
        IfElse ifElse = new IfElse();
        vm.stopBroadcast();
        return ifElse;
    }
}
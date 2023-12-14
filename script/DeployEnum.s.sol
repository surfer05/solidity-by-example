// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Enum} from "../src/enum.sol";

contract DeployEnum is Script {

    function run() external returns (Enum) {
        vm.startBroadcast();
        Enum en = new Enum();
        vm.stopBroadcast();
        return en;
    }
}
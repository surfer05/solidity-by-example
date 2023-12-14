// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Mapping, NestedMapping} from "../src/mapping.sol";

contract DeployMapping is Script {

    function run() external returns (Mapping, NestedMapping) {
        vm.startBroadcast();
        Mapping mappping = new Mapping();
        NestedMapping nested = new NestedMapping();
        vm.stopBroadcast();
        return (mappping, nested);

    }
}
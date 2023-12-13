// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


import {Script} from "forge-std/Script.sol";
import {ReadAndWrite} from "../src/readAndWrite.sol";

contract DeployReadAndWrite is Script {
    function run() external returns (ReadAndWrite){
        vm.startBroadcast();
        ReadAndWrite readAndwrite = new ReadAndWrite();
        vm.stopBroadcast();
        return readAndwrite;
    }
}
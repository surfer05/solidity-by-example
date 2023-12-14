// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {GasPrice} from "../src/outOfGas.sol";

contract DeployOutOfGas is Script { 
    function run() external returns(GasPrice) {
        vm.startBroadcast();
        GasPrice gasPrice = new GasPrice();
        vm.stopBroadcast();
        return gasPrice;
    }
}
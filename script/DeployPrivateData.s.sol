// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {Vault} from "../src/3-Hacks/privateData.sol";

contract DeployPrivateData is Script {

    function run() external returns (Vault) {
        vm.startBroadcast();
        Vault vault = new Vault();
        vm.stopBroadcast();
        return vault;
    }
}
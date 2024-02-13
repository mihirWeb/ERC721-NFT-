// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {KittyNFT} from "../src/KittyNFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployNFT is Script{

    function run() external returns(KittyNFT){
        vm.startBroadcast();
        KittyNFT kittyNFT = new KittyNFT();
        vm.stopBroadcast();

        return kittyNFT;
    }
}
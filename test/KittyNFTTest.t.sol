// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployNFT} from "../script/Deploy.s.sol";
import {Test} from "forge-std/Test.sol";
import {KittyNFT} from "../src/KittyNFT.sol";

contract KittyNFTTes is Test{

    DeployNFT deployNFT;
    KittyNFT kittyNFT;

    function setUp() external{
        
        deployNFT = new DeployNFT();        
        kittyNFT = deployNFT.run();
    }
}
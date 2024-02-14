// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployNFT} from "../script/Deploy.s.sol";
import {Test} from "forge-std/Test.sol";
import {KittyNFT} from "../src/KittyNFT.sol";

contract KittyNFTTes is Test{

    DeployNFT public deployNFT;
    KittyNFT public kittyNFT;

    function setUp() external{

        deployNFT = new DeployNFT();        
        kittyNFT = deployNFT.run();
    }

    function testNameOfNft() public{
        string memory expectedName = "Kitty";
        string memory actualName = kittyNFT.name();

        assertEq(expectedName, actualName);
    }

    function testSymbolOfNft() public{
        string memory expectedSymbol = "Cat";
        string memory actualSymbol = kittyNFT.symbol();

        assertEq(expectedSymbol, actualSymbol);
    }
}
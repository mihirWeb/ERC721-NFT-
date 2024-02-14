// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployNFT} from "../script/Deploy.s.sol";
import {Test} from "forge-std/Test.sol";
import {KittyNFT} from "../src/KittyNFT.sol";

contract KittyNFTTes is Test{

    DeployNFT public deployNFT;
    KittyNFT public kittyNFT;

    address private User = makeAddr("user");
    string constant CAT = "../nftImages/Blackkitty.jpeg";

    function setUp() external{

        deployNFT = new DeployNFT();        
        kittyNFT = deployNFT.run();
    }

    function testNameOfNft() public{
        string memory expectedName = "Kitty";
        string memory actualName = kittyNFT.name();

        assertEq(expectedName, actualName);
    }

    function testSymbolOfNft() view public{
        string memory expectedSymbol = "Cat";
        string memory actualSymbol = kittyNFT.symbol();

        assert(keccak256(abi.encodePacked(expectedSymbol)) ==  keccak256(abi.encodePacked(actualSymbol)));
    }

    function testTokenCounterIncrement() public{


        uint256 totalMints = 6;
        for(uint256 i=0; i<totalMints; i++){
            vm.prank(User);
            kittyNFT.mintNFT(CAT);
        }

        uint256 expectedTokenCounter = totalMints;
        uint256 actualTokenCounter = kittyNFT.getTokenCounter();

        assertEq(expectedTokenCounter, actualTokenCounter);
    }

    function testCanMintAndHaveBalance() public{
        vm.prank(User);
        kittyNFT.mintNFT(CAT);

        assert(kittyNFT.balanceOf(User) == 1);

        assert(keccak256(abi.encodePacked(kittyNFT.tokenURI(0))) == keccak256(abi.encodePacked(CAT)));
    }
}
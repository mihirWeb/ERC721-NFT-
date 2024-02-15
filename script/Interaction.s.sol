// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {KittyNFT} from "../src/KittyNFT.sol";
import {Script} from "forge-std/Script.sol";

contract MintNFT is Script{

    string kittyURI = "ipfs://QmaMh48Zkt4suvHfPAqphXEr3QQXqGejX7F4nUJXVreJUQ";

    function run() external {
    
        address mostRecentlyDeployedContract = DevOpsTools.get_most_recent_deployment("KittyNFT" , block.chainid);

        mintNFTWithFunction(mostRecentlyDeployedContract);    
    }

    function mintNFTWithFunction(address recentlyDeployedContract) public{
        
        vm.startBroadcast();
        KittyNFT(recentlyDeployedContract).mintNFT(kittyURI);
        vm.stopBroadcast();
    }
}


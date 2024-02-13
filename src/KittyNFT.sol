// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract KittyNFT is ERC721 {

    uint256 private s_tokenCounter;

    mapping(uint256 => string) private s_tokenIdToTokenURI;
    
    // constructor
    constructor() ERC721("Kitty", "Cat"){
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public returns(uint256){
        s_tokenCounter++;

        _safeMint(msg.sender, s_tokenCounter); 
        // _safeMint is a function in openzeppelin that defines 
        // the ownership of NFT to the address given with the token ID after its creation

        s_tokenIdToTokenURI[s_tokenCounter] = tokenUri;
        return s_tokenCounter;
    }

    function tokenURI(uint256 tokenId) view override public returns(string memory){
        return s_tokenIdToTokenURI[tokenId];
    }

}
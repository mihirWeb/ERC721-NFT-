// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract KittyNFT is ERC721 {

    uint256 private s_tokenId;

    mapping(uint256 => string) private s_tokenIdToTokenURI;
    
    // constructor
    constructor() ERC721("Kitty", "Cat"){}

    

    function tokenURI(uint256 tokenId) view override public returns(string memory){
        return s_tokenIdToTokenURI[tokenId];
    }

}
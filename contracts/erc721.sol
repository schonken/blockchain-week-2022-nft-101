// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BlockchainWeek2022NFT101 is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Blockchain Week NFT 101", "BW-2022-NFT-101") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmVLxiz4Ue3XTzuS1kyMLvPrjchBveYGnkJFrnwKeSXiGG/";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
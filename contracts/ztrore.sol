// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ztrore is ERC721, ERC721Enumerable {
    using Counters for Counters.Counter;

    Counters.Counter private _idCounter;
    uint256 public maxSupply; //limit

    constructor(uint256 _maxSupply) ERC721("ztrore", "ZTR") {
        maxSupply =_maxSupply;
    }

    function mint() public {
        uint256 current = _idCounter.current();
        require(current < maxSupply, "No NFTs left :("); //limit
        _safeMint(msg.sender, current);
        _idCounter.increment();
    }

    // The following functions are overrides required by Solidity.
    // ERC721Enumerable saves a map with the number of tokens and the list of those belonging to an address.
    // Each time a token transfer is made, this token needs to be extracted from this list and 
    // insert it on a new map, which coresponds with the new owner of this NFT
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract FlowersNftCollection is ERC721, ERC721URIStorage, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;
    using Strings for uint256;


    Counters.Counter private _tokenIdCounter;
    
    string public baseURI_;
    uint256 public mintPrice;

    event LogTokenMinted(address indexed minter, uint256 indexed tokenId);
    event BaseURIUpdated(string indexed oldValue, string indexed newValue);
    event MintPriceUpdated(uint256 indexed oldValue, uint256 indexed newValue);

    constructor(string memory baseUri) ERC721("FlowersNftCollection", "FNft") {
        
    baseURI_ = baseUri;
    mintPrice = 0.001 ether;
    }

    function setBaseURI(string memory _newBaseURI) external onlyOwner {
        emit BaseURIUpdated(baseURI_, _newBaseURI);
        baseURI_ = _newBaseURI;
    }

      function _baseURI() internal view override returns (string memory) {
        return baseURI_;
    }



    function setMintPrice(uint256 _newPrice) external onlyOwner {
        // Mint price in wei
        emit MintPriceUpdated(mintPrice, _newPrice);
        mintPrice = _newPrice;
    }

    function mintItem(address player) external payable returns (uint256) {
        require(msg.value >= mintPrice, "pay the required amount");

        _tokenIdCounter.increment();
        uint256 newItemId = _tokenIdCounter.current();
        _safeMint(player, newItemId);

        emit LogTokenMinted(player, newItemId);

        return newItemId;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }


    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
          _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI,"/", tokenId.toString(),".Json")) : "";
    }
}
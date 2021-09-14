// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

/**
 * @title Retrography contract
 * @dev Extends ERC721 Non-Fungible Token Standard basic implementation
 */
contract Retrography is ERC721, ERC721Enumerable, Ownable {

    string public PROVENANCE = "";
    uint256 public tokenPrice = 70000000000000000; // 0.07 ETH
    uint public constant maxTokenPurchase = 15;
    uint256 public MAX_TOKENS = 10000;
    bool public saleIsActive = false;

    string private _baseURIextended;

    constructor() ERC721("Retrography", "RETRO") {
    }

    // CHANGED: needed to resolve conflicting fns in ERC721 and ERC721Enumerable
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // CHANGED: needed to resolve conflicting fns in ERC721 and ERC721Enumerable
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    // CHANGED: added to account for changes in openzeppelin versions
    function setBaseURI(string memory baseURI_) external onlyOwner() {
        _baseURIextended = baseURI_;
    }

    // CHANGED: added to account for changes in openzeppelin versions
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }

    function setProvenance(string memory provenance) public onlyOwner {
        PROVENANCE = provenance;
    }

    function reserveTokens() public onlyOwner {        
        uint supply = totalSupply();
        uint i;
        for (i = 0; i < 100; i++) {
            _safeMint(msg.sender, supply + i);
        }
    }
    
    function flipSaleState() public onlyOwner {
        saleIsActive = !saleIsActive;
    }
    
    function settokenPrice(uint _fee) external onlyOwner {
        tokenPrice = _fee;
    }

    function gettokenPrice() external view returns (uint){
        return tokenPrice;
    }

    function mintRetro(uint numberOfTokens) public payable {
        require(saleIsActive, "Sale must be active to mint Tokens");
        require(numberOfTokens <= maxTokenPurchase, "Exceeded max token purchase");
        // CHANGED: mult and add to + and *
        require(totalSupply() + numberOfTokens <= MAX_TOKENS, "Purchase would exceed max supply of tokens");
        // CHANGED: mult and add to + and *
        require(tokenPrice * numberOfTokens <= msg.value, "Ether value sent is not correct");
        
        for(uint i = 0; i < numberOfTokens; i++) {
            uint mintIndex = totalSupply();
            if (totalSupply() < MAX_TOKENS) {
                _safeMint(msg.sender, mintIndex);
            }
        }
    }

    function withdraw() public onlyOwner {
        uint balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

}
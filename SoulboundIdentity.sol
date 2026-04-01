// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SoulboundIdentity
 * @dev Implementation of EIP-5192 Minimal Soulbound Tokens.
 */
contract SoulboundIdentity is ERC721, Ownable {
    uint256 private _nextTokenId;

    event Locked(uint256 tokenId);

    constructor(string memory name, string memory symbol) 
        ERC721(name, symbol) 
        Ownable(msg.sender) 
    {}

    /**
     * @dev Mint a new soulbound token to a user.
     */
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        emit Locked(tokenId);
    }

    /**
     * @dev EIP-5192: Returns the locking status of a token.
     * For SBTs, this is always true.
     */
    function locked(uint256 tokenId) external view returns (bool) {
        require(_ownerOf(tokenId) != address(0), "Nonexistent token");
        return true;
    }

    /**
     * @dev Disable transfers by overriding the internal update function.
     */
    function _update(address to, uint256 tokenId, address auth) 
        internal 
        virtual 
        override 
        returns (address) 
    {
        address from = _ownerOf(tokenId);
        // Allow minting (from == address(0)) and burning (to == address(0))
        // But prevent transfers (from != address(0) && to != address(0))
        if (from != address(0) && to != address(0)) {
            revert("Token is Soulbound and cannot be transferred");
        }
        return super._update(to, tokenId, auth);
    }

    function burn(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }
}

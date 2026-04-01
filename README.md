# Soulbound Reputation System (SBT)

A professional-grade implementation of non-transferable NFTs, commonly known as Soulbound Tokens (SBTs). This repository follows the EIP-5192 standard, ensuring that once a token is minted to a "Soul" (wallet), it cannot be moved, sold, or transferred, making it ideal for academic credentials, KYC status, or DAO reputation.

## Core Features
* **Non-Transferable:** Overrides `_update` logic to prevent any movement after minting.
* **EIP-5192 Compliant:** Implements the `locked` function and `Locked` events for indexing.
* **Metadata Flexibility:** Supports IPFS-linked metadata for rich identity profiles.
* **Administrative Burn:** Allows the issuer to revoke tokens if credentials become invalid.

## Use Cases
* **DeFi Credit Scores:** Track repayment history on-chain.
* **DAO Contribution:** Reward active participants with unstackable voting power.
* **Certifications:** Issue tamper-proof diplomas or course completion badges.

## Setup
1. `npm install`
2. Deploy `SoulboundIdentity.sol`.
3. Use the `mint` function to assign a credential to a specific address.

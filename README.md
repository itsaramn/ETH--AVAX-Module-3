# Types of Function

This Solidity program is a token contract that implements the ERC20 standard. It allows the creation, transfer, and burning of tokens. The purpose of this contract is to serve as a template for creating custom tokens on the Ethereum blockchain.

## Description

This contract is implemented in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract extends the ERC20 contract from the OpenZeppelin library, which provides a standardized interface for tokens on the Ethereum network. The contract also includes an additional modifier, `onlyOwner`, to restrict certain functions to be called only by the contract owner.

## Getting Started

### Prerequisites

To deploy and interact with this contract, you will need:

- A development environment such as Remix or Truffle.
- Access to an Ethereum network (local or testnet) to deploy the contract.
- The OpenZeppelin library installed.

### Deployment

1. Open your preferred Solidity development environment (e.g., Remix).
2. Create a new Solidity file and save it with a .sol extension (e.g., MyToken.sol).


```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address private _tokenOwner; // Private variable to store the contract owner's address

    constructor() ERC20("CustomToken", "CTK") {
        _tokenOwner = msg.sender; // Assigns the contract deployer's address as the owner
    }

    modifier onlyTokenOwner() {
        require(msg.sender == _tokenOwner, "Only the token owner can call this function");
        _; // Placeholder where the modified function is executed
    }

    function mintTokens(address account, uint256 amount) external onlyTokenOwner payable {
        _mint(account, amount); // Creates new tokens and assigns them to the specified account
    }

    function customTransfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount); // Transfers tokens from the sender's address to the recipient
        return true; // Indicates a successful transfer
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount); // Destroys tokens from the sender's address
    }
}

```
3. Copy and paste the code from the provided code snippet into the file.
4. Make sure you have the OpenZeppelin library imported correctly.
5. Compile the contract using the appropriate Solidity compiler version (e.g., 0.8.0).
6. Deploy the contract to your desired Ethereum network, ensuring that you have sufficient funds to cover deployment costs.
7. Take note of the deployed contract's address for future interactions.

### Interacting with the Contract

Once the contract is deployed, you can interact with it using various methods. Here are a few examples:

- *Minting Tokens*: Only the contract owner can mint new tokens. Use the `mint` function, providing the recipient's address and the amount of tokens to be minted.

- *Transferring Tokens*: Use the `transfer` function to transfer tokens from your address to another address. Provide the recipient's address and the amount of tokens to transfer.

- *Burning Tokens*: To destroy tokens from your address, use the `burn` function and specify the amount of tokens to burn.

Please refer to the Solidity documentation for more information on interacting with ERC20 contracts.

## Authors

Aryaman Semta

21bcs3853@cuchd.in

## License

This project is licensed under the MIT License.

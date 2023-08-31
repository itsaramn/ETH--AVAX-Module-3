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

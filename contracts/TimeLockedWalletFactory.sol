// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TimeLockedWallet.sol";

contract TimeLockedWalletFactory {
    mapping(address => address[]) wallets;

    function getWallets(address _user)
        public
        view
        returns(address)
    {
        return (_user);
    }

    function newTimeLockedWallet(address _owner, uint256 _unlockDate)
        public payable
        returns(address wallet)
    {
        // Create new wallet.
       // Add wallet to sender's wallets.
        wallets[msg.sender].push(wallet);

        // If owner is the same as sender then add wallet to sender's wallets too.
        if(msg.sender != _owner){
            wallets[_owner].push(wallet);
        }

        // Emit event.
        emit Created(wallet, msg.sender, _owner, block.number * 15, _unlockDate, msg.value);
    }

    event Created(address wallet, address from, address to, uint256 createdAt, uint256 unlockDate, uint256 amount);
}

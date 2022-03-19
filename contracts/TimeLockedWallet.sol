// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";

contract TimeLockedWallet {

    event Received(address from, uint256 amount);
    event Withdrew(address to, uint256 amount);
    event WithdrewTokens(address tokenContract, address to, uint256 amount);

    address public creator;
    address public owner;
    uint256 public unlockDate;
    uint256 public createdAt;

    modifier onlyOwner {
        require(msg.sender == owner, "register for wallet");
        _;
    }

    constructor(
        address _creator,
        address _owner,
        uint256 _unlockDate
    ){
        creator = _creator;
        owner = _owner;
        unlockDate = _unlockDate;
        createdAt = block.number * 15;
    }

    // keep all the ether sent to this address


    // callable by owner only, after specified time
    function  withdraw() public onlyOwner {
        require (block.number * 15 >= unlockDate, "Not possible");
       // now send all the balance
        emit Withdrew(msg.sender, address(this).balance);
    }

    // callable by owner only, after specified time, only for Tokens implementing ERC20
    function withdrawTokens(address _tokenContract) public onlyOwner {
        require (block.number * 15 >= unlockDate, "invalid time");
        ERC20 token = ERC20(_tokenContract);
       // now send all the token balance
        uint256 tokenBalance = token.balanceOf(address(this));
        token.transfer(owner, tokenBalance);
        emit WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
    }

    function info() public view returns(address, address, uint256, uint256, uint256) {
        return (creator, owner, unlockDate, createdAt, address(this).balance);
    }



}

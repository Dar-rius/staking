pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./Accounts.sol";

contract Token is ERC20, Accounts{
    constructor(address _account2, uint256 _value) ERC20("MATEC", "MAT"){
        //mint 2000000 tokens 
        _mint(msg.sender, 2000000);
        
        //Transfer tokens in this address
        transfer(_account2, _value);
    }
}

pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./Accounts.sol";

contract Token is ERC20, Accounts{
    constructor() ERC20("MATEC", "MAT"){
        //mint 2000000 tokens 
        _mint(msg.sender, 2000000);
    }
}

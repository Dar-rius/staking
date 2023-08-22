pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../src/Accounts.sol";

contract Token is ERC20, Accounts{
    constructor() ERC20("MATEC", "MAT"){
        //mint 2000000 tokens 
        _mint(account1, 2000000);

        transferFrom(account1, account2, 20000);
    }
}

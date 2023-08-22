pragma solidity ^0.8.18;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    constructor() ERC20("MATEC", "MAT"){_mint(address(0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5), 20000);}
}

pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    constructor() ERC20("MATEC", "MATE"){
        //mint 2000000 tokens 
        _mint(msg.sender, 2000000);
    }

    // function permettant de transferer des token a une adresse apres le staking
    function transferStaking(address _to, bool _accountStak, uint256 _amount) external returns(bool){
        require(_to != address(0), "Error in address");
        require(_accountStak, "This address don't account for staking");
        _mint(_to, _amount);
        return true;
    }
}

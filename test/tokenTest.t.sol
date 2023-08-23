pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/Accounts.sol";

contract TokenTest is Test, Accounts{
    Token token;

    function setUp() external {
        token = new Token(account2, 2000);
    }

    // fonction de test pour minter des tokens vers la balance du owner
    function test_mint() external{
        assertEq(token.balanceOf(account1), 1998000);
        assertEq(token.balanceOf(account2), 2000);
    }
}

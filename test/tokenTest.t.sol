pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/Accounts.sol";

contract TokenTest is Test, Accounts{
    Token token;

    function setUp() external {
        token = new Token();
    }

    function test_mint() external{
        assertEq(token.balanceOf(account1), 2000000);
    }

    function test_balanceAccount() external{
        assertEq(token.balanceOf(account2), 20000);
    }
}

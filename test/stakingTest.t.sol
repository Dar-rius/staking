pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/staking.sol";

contract StakingTest is Test{
    Staking stak;
    Token token;
    address addr1 = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5;

    function setUp() external {
        token = new Token();
        stak = new Staking(10, 3);
    }

    function test_balanceStaking() external{
        stak.goStaking(addr1, 200);
        assertEq(stak.getTotalStaking(addr1), 200);
    }
}

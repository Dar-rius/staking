pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "./src/stacking.sol";
import "./src/ERC20.sol";

contract StakingTest is Test{
    Staking stak;
    ERC20 token;
    address addr1 = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5

    function setUp() external {
        stak = new Staking(10, 3);
        token = new ERC20();
    }

    function test_balanceStaking() external{
        stak.goStaking(addr1, 200);
        assertEq(stak.balance[addr1].totalStaking(), 200);
    }
}

pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/staking.sol";

contract StakingTest is Test{
    Staking stak;
    Token token;
    error  AccountDoNotExist();
    address addr1 = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5;
        event Transfer(address indexed _from, address indexed _to, uint256 _amount);

    function setUp() external {
        token = new Token();
        stak = new Staking(10, 3);
    }

    //test sur le bon fonctionnement des features 
    //tetst sur la fonction de staking
    function test_onStaking() external returns(bool){
        stak.goStaking(addr1, 200);
        assertEq(stak.getTotalStaking(addr1), 200);
        if (stak.checkStaking(addr1) > 10){
            return true;
        } else {
            return false;
        }
    }

    //test sur la fonctionnalite d'arret duu staking
    function test_unStaking() external{
        stak.goStaking(addr1, 200);
        stak.unStaking(addr1);
        vm.expectEmit(true, true, false, true);
        emit Transfer(addr1, addr1, 54);
        assertEq(token.balanceOf(addr1), 20054);
    }
    //test sur les potentiels problemes
}

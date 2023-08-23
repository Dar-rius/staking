pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/Staking.sol";
import "../src/Accounts.sol";

contract StakingTest is Test, Accounts{
    Staking stak;
    Token token;
    error  AccountDoNotExist();
        event Transfer(address indexed _from, address indexed _to, uint256 _amount);

    function setUp() external {
        token = new Token();
        token.transfer(account2, 2000);
        stak = new Staking(token, 10, 3);
    }

    //test sur le bon fonctionnement des features 
    //tetst sur la fonction de staking
    function test_onStaking() external returns(bool){
        stak.goStaking(account2, 200);
        assertEq(stak.getTotalStaking(account2), 200);
        if (stak.checkStaking(account2) > 10){
            return true;
        } else {
            return false;
        }
    }

    //test sur la fonctionnalite d'arret duu staking
    function test_unStaking() external{
        vm.prank(account2);
        stak.goStaking(account2, 200);
        stak.unStaking(account2);
        vm.expectEmit(true, true, false, true);
        emit Transfer(account1, account2, 54);
        assertEq(token.balanceOf(account2), 2054);
    }
    //test sur les potentiels problemes
}

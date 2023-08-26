pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/Token.sol";
import "../src/Staking.sol";
import "../src/Accounts.sol";

contract StakingTest is Test, Accounts{
    Staking stak;
    Token token;
    error  AccountDoNotExist();
    error StakDoNotFinshed();
        event Transfer(address indexed _from, address indexed _to, uint256 _amount);

    function setUp() external {
        token = new Token();
        token.transfer(account2, 2000);
        stak = new Staking(token, 10, 3);
    }

    //test sur le bon fonctionnement des features 
    //tetst sur la fonction de staking
    function test_onStaking() external returns(bool){
        vm.prank(account2);
        stak.goStaking(200);
        vm.prank(account2);
        assertEq(stak.getTotalStaking(), 200);
        vm.prank(account2);
        if (stak.checkStaking() > 10){
            return true;
        } else {
            return false;
        }
    }

    //test sur la fonctionnalite d'arret duu staking
    function test_unStaking() external{
        vm.prank(account2);
        stak.goStaking(200);
        vm.prank(account2);
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(0), account2, 54);
        stak.unStaking();
        assertEq(token.balanceOf(account2), 2054);
    }

    //test sur checking du reward
    function test_checkStaking() external{
        vm.prank(account2);
        stak.goStaking(200);
        vm.prank(account2);
        assertEq(stak.checkStaking(), 54);
    }

    //Echec sur les tests
    //test sur la fin totale d'une processus de staking
    function testMultipleExpectReverts_endStak() external{
        vm.prank(account2);
        stak.goStaking(200);
        vm.expectRevert("Time is not Over");
        vm.prank(account2);
        stak.endingStak();
    }
}

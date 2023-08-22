pragma solidity ^0.8.19;

import "./Token.sol";

contract Staking{

    // instance du contrat ERC20
    Token token = new Token();

    // error messages
    error stakDoNotFinshed();
    error stakIsFinished();

    // Variables
    uint256 times;
    uint256 rateReward;
    address owner;

    // Structure for balance's staker
    struct stakData{
        uint256 totalStaking;
        uint256 reward;
        uint256 duration;
    }

    //Balance for staker
    mapping (address => stakData) balance;

    constructor(uint256 _times, uint256 _rateReward){
        owner = msg.sender;
        times = _times;
        rateReward = _rateReward;
    }

    // group features for staking
    //get times for staking 
    function getTimes() external view returns(uint256){
        return times;
    }

    // get rate reward for staking
    function getRateReward() external view returns(uint256){
        return rateReward;
    }

    function getTotalStaking(address _account) external view returns(uint256) {
        return balance[_account].totalStaking;
    }

    // go staking a amount 
    function goStaking(address _account, uint256 _amount) external{
        require(_account != address(0) || _account != owner);
        require(_amount > 0);
        require(token.balanceOf(_account) >= _amount);
        balance[_account].totalStaking = _amount;
        balance[_account].reward = _stak(_account);
    }
    
    // stop staking
    function unStaking(address _account) external {
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);

        if (balance[_account].duration > 0){
            stakData storage staker = balance[_account];
            uint256 totalReward = staker.totalStaking + staker.reward;
            delete balance[_account];
            token.transfer(_account, totalReward);
        }else{
            revert stakIsFinished();
        }
    }

    //check the state of staking
    function checkStaking(address _account) external view returns(uint256){
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);
        return balance[_account].reward;
    }

    //Ending stak
    function endingStak(address _account) external {
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);
        stakData storage staker = balance[_account];
        
        if (staker.duration == 0){
            uint256 totalReward = staker.totalStaking + staker.reward;
            delete balance[_account];
            token.transfer(_account, totalReward);    
        } else {
            revert stakDoNotFinshed();
        }
    }


    // function for compute stak
    function _stak(address _account) internal returns(uint256){
        stakData storage staker = balance[_account];
        staker.duration = times - block.timestamp;
        return (staker.totalStaking*rateReward*staker.duration)/100;
    }
}

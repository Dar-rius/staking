pragma solidity ^0.8.19;

import "./ERC20.sol";

contract Stacking{

    // instance du contrat ERC20
    ERC20 token = new ERC20();
    token._mint(address(0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5), 20000);

    // error messages
    error stakDoNotFinshed;
    error stakIsFinished;

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
        owner = msg.sender();
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

    // go staking a amount 
    function goStaking(address _account, uint256 _amount) external{
        require(_account != address(0) || _account != owner);
        require(_amount > 0);
        require(erc20.balanceOf[_account] >= _amount);
        balance[_account].reward = _stak(_account, _amount);
        erc20.transfer(_account, _amount);
    }
    
    // stop staking
    function unStaking(address _account) external {
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);

        if (balance[_account].duration > 0)){
            uint256 staker = balance[_account];
            uint256 totalReward = staker.totalStaking + staker.reward;
            delete balance[_account];
            token.transfer(_account, totalReward);
        }else{
            revert stakIsFinished;
        }
    }

    //check the state of staking
    function checkStaking(address _account) external returns(uint256){
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);
        return balance[_account].reward;
    }

    //Ending stak
    function endingStak(address _account) external {
        require(_account != address(0) || _account != owner);
        require(balance[_account].totalStaking > 0);
        uint256 staker = balance[_account];
        
        if (staker.duration == 0){
            uint256 totalReward = staker.totalStaking + staker.reward;
            delete balance[_account];
            token.transfer(_account, totalReward);    
        } else {
            revert stakDoNotFinshed;
        }
    }


    // function for compute stak
    function _stak(address _account, uint256 _amount) internal returns(uint256){
        uint256 staker = balance[_account];
        staker.duration = times - block.timestamp;
        return (_amount*rateReward*staker.duration)/100;
    }
}

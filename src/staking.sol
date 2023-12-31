pragma solidity ^0.8.19;
pragma abicoder v2;

import {Token} from "./Token.sol";

contract Staking {
    
    // instance du contrat ERC20
    Token private immutable token;

    // Variables
    uint8 private immutable times;
    uint8 private immutable rateReward;
    address private immutable owner;
    bool private paused;

    // Structure for balance's staker
    struct stakData{
        uint256 reward;
        uint64 totalStaking;
        uint duration;
        bool accountStak;
    }

    //Balance for staker
    mapping (address => stakData) private balance;

    constructor(Token _token, uint8 _times, uint8 _rateReward){
        token = _token;
        owner = msg.sender;
        times = _times;
        rateReward = _rateReward;
    }

    // group features for staking
    //get times for staking 
    function getTimes() external view returns(uint8){
        return times;
    }

    // get rate reward for staking
    function getRateReward() external view returns(uint8){
        return rateReward;
    }

    function getTotalStaking() external view returns(uint64) {
        address sender = msg.sender;
        require(sender != owner);
        require(balance[sender].accountStak, "Account do not exist");
        return balance[sender].totalStaking;
    }

    // go staking a amount 
    function goStaking(uint64 _amount) external{
        address sender = msg.sender;
        require(sender != owner);
        require(_amount > 0, "problem in value");
        require(_amount < 1000000, "problem in value");
        require(token.balanceOf(sender) >= _amount);
        stakData storage staker = balance[sender];
        staker.totalStaking = _amount;
        staker.reward += _stak(staker);
        staker.accountStak = true;
    }
    
    // stop staking
    function unStaking() external {
        address sender = msg.sender;
        _checkTime(sender);
        require(sender != owner, "Is owner");
        require(balance[sender].accountStak, "Account do not exist");
        require(paused, "Time is Over");
        stakData storage staker = balance[sender];
        uint256 reward = staker.reward;
        bool accountStak = staker.accountStak;
        delete balance[sender];
        token.transferStaking(sender, accountStak, reward);
    }

    //check the state of staking
    function checkStaking() external view returns(uint256){
        address sender = msg.sender;
        require(sender != owner);
        require(balance[sender].accountStak, "Account do not exist");
        return balance[sender].reward;
    }

    //Ending stak
    function endingStak() external {
        address sender = msg.sender;
        _checkTime(sender);
        require(sender != owner);
        require(balance[sender].accountStak, "Account do not exist");
        require(!paused, "Time is not Over");
        stakData storage staker = balance[sender];
        uint256 reward = balance[sender].reward;
        bool accountStak = staker.accountStak;
        delete balance[sender];
        token.transferStaking(sender, accountStak, reward);
        }


    // function for compute stak
    function _stak(stakData storage _staker) internal returns(uint256){
        _staker.duration = times-block.timestamp;
        return (_staker.totalStaking*rateReward*_staker.duration)/100;
    }

    // Function to check time 
    function _checkTime(address _account)  internal {
        if (balance[_account].duration > 0){
            paused = true;
        }
    }
}

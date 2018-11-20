pragma solidity 0.4.24;

import './coin.sol';
import '/home/shahzad/node_modules/zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';
import '/home/shahzad/node_modules/zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';


contract GustavoCoinCrowdsale is TimedCrowdsale, MintedCrowdsale {
    function GustavoCoinCrowdsale
        (
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            address _wallet,
            MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token)
        TimedCrowdsale(_openingTime, _closingTime) {

        }
}

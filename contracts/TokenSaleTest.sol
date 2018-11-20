pragma solidity ^0.4.22;

import './TokenTest.sol';
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";


contract TokenSaleTest {
  using SafeMath for uint256;

  TokenTest public token;
  address public wallet;
  uint256 public rate;

  // Amount of wei raised
  uint256 public weiRaised;

  event TokenPurchase(
    address indexed purchaser,
    address indexed beneficiary,
    uint256 value,
    uint256 amount
  );



  constructor(uint256 _rate, address _wallet, TokenTest _token) public {
      require(_rate > 0);
      require(_wallet != address(0));
      require(_token != address(0));

      token = _token;
      rate = _rate;
      wallet = _wallet;
  }


  function () external payable {
       buyTokens(msg.sender);
  }


  function buyTokens(address _beneficiary) public payable 
  {
       uint256 weiAmount = msg.value;
       _preValidatePurchase(_beneficiary, weiAmount);

       uint256 tokens = _getTokenAmount(weiAmount);

       weiRaised = weiRaised.add(weiAmount);

       _deliverTokens(_beneficiary, tokens);

       _forwardFunds();

       emit TokenPurchase(
         msg.sender,
         _beneficiary,
         weiAmount,
         tokens
       );
  }


  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal
  {
      require(_beneficiary != address(0));
      require(_weiAmount != 0);
  }



  function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal
  {
      token.transfer(_beneficiary, _tokenAmount);
  }


  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256)
  {
      return _weiAmount.div(rate);
  }


  function _forwardFunds() internal 
  {
      wallet.transfer(msg.value);
  }

}

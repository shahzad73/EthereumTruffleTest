pragma solidity ^0.4.22;

import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract PullPaymentTest{
  using SafeMath for uint256;

  event PaymentReceivedEvent(address dest, uint256 amount);  
  event AsyncPaymentEventSet(uint256 amount, uint256 totalPayments);
  event PaymentSendEvent(address dest, uint256 amount);  


  function HelloWorld() pure public returns (string) {
    	return "Hello World";
  }

  function () public payable { 
	emit PaymentReceivedEvent(msg.sender, msg.value);
  }


  function asynMarkPayment (address dest, uint256 amount) public {
	asyncSend(dest, amount);
	emit AsyncPaymentEventSet(amount, totalPayments);
  }



  

  mapping(address => uint256) public payments;
  uint256 public totalPayments;

  /**
  * @dev Withdraw accumulated balance, called by payee.
  */
  function withdrawPayments() public {
    address payee = msg.sender;
    uint256 payment = payments[payee];

    require(payment != 0);
    require(address(this).balance >= payment);

    totalPayments = totalPayments.sub(payment);
    payments[payee] = 0;

    payee.transfer(payment);
    emit PaymentSendEvent(payee, payment);
  }

  /**
  * @dev Called by the payer to store the sent amount as credit to be pulled.
  * @param dest The destination address of the funds.
  * @param amount The amount to transfer.
  */
  function asyncSend(address dest, uint256 amount) internal {
    payments[dest] = payments[dest].add(amount);
    totalPayments = totalPayments.add(amount);
  }


}


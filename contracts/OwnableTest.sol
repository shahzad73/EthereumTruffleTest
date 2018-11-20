pragma solidity ^0.4.22;

import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract OwnableTest is Ownable{

  function HelloWorld() pure public returns (string) {
    	return "Hello World";
  }

}


//OwnableTest.deployed().then(function(ins) { return ins.transferOwnership('0xa943eb83821d4c6777330769d55d53e94a5b52a0'), {"from":"0x62241e29009ac0015bf8f3aef4a8b4e58bdc5095"}})


// OwnableTest.deployed().then(function(ins) {return ins.owner()})

pragma solidity ^0.4.18;

contract SimpleTest {
    
	  string public currentString;
	  uint8 public currentInt;

	  function SimpleTest(string cs, uint8 ci) public {
		currentString = cs;
		currentInt = ci;
	  }
	  

	  function setCurrentData(string cs, uint8 ci) public {
		currentString = cs;
		currentInt = ci;
	  }


	  function getCurrentData() view public returns (string)
	  {
		 return currentString;
	  }
  

}

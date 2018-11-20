pragma solidity ^0.4.11;
contract sample1 {

	 string public name = "ZeonLab";

	 event datachange(string name);


	 function set(string _name) public {
	     name = _name;
             emit datachange(name);
	 }
	 
	 function get() constant public returns (string) {
	     return name;
	 }

}

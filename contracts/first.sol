pragma solidity ^0.4.17;
contract First 
{
	int public mydata;
	function GetDouble(int _data) public returns (int _output) 
	{
		mydata = _data * 3;
		return _data * 3;
	}
}

pragma solidity ^0.4.17;
import "./first.sol";

contract Second 
{
	address firstAddress;
	
	int public _data;
	function Second(address _first) public {
		firstAddress = _first;
	}

	function SetData() public {
		First h = First(firstAddress);
		_data = h.GetDouble(21);
	}
}

pragma solidity ^0.4.22;

//import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Lucas {
   using SafeMath for uint; 
   
   uint[] lucseries;
   
   function generateLuc(uint n) public returns (string)  {
   
     lucseries.push(2);
     lucseries.push(1);
   
     for (uint i=2; i < n ; i++) {
        lucseries.push(lucseries[i-1].add( lucseries[i-2]));
     }
    
     return "Hello there";
   }


  function HelloWorld() pure public returns (string) {
    return "Hello World";
  }

}

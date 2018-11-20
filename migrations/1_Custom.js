//var hw = artifacts.require("First");
//var hw1 = artifacts.require("Second");
//var vot = artifacts.require("Voting");
//var vot2 = artifacts.require("Voting2");
//var st = artifacts.require("SimpleTest");
var sim = artifacts.require("sample1");
//var luc = artifacts.require("Lucas");
var OwnableTest = artifacts.require("OwnableTest");
var ClaimableTest = artifacts.require("ClaimableTest");
var PauseableDestructableTest = artifacts.require("PauseableDestructableTest");
var PullPaymentTest = artifacts.require("PullPaymentTest");
var TokenTest = artifacts.require("TokenTest");
var TokenSale = artifacts.require("TokenSaleTest");






module.exports = function(deployer) {
  //deployer.deploy(hw).then(function(){
  //    return deployer.deploy(hw1, hw.address)  
  //})

  //deployer.deploy(vot, ['Rama', 'Nick', 'Jose'], {gas: 670000})
  //deployer.deploy(st, "InitialText", 10 ,{gas: 470000})
  //deployer.deploy(sim ,{gas: 470000})
  //deployer.deploy(luc, {gas: 470000})
  //deployer.deploy(vot2, {gas: 670000})
  //deployer.deploy(OwnableTest ,{gas: 470000})
  //deployer.deploy(ClaimableTest ,{gas: 670000})
  //deployer.deploy(PauseableDestructableTest ,{gas: 670000})
  //deployer.deploy(PullPaymentTest ,{gas: 670000})
  //deployer.deploy(TokenTest ,{gas: 4712388})


  deployer.deploy(TokenTest, {gas: 6721975}).then(function() {
      const tokenPrice = 10000000000000000;
      
      deployer.deploy(TokenSale, tokenPrice, "0xd7228a092737f8a5425238bcdb7a633631885e75", TokenTest.address, {gas: 6721975}).then(function() 
      {
    	   var token = TokenTest.at(TokenTest.address);
      
           token.transfer(TokenSale.address, 1200000000);
           
           console.log("Address is --------");
      });
  });


};





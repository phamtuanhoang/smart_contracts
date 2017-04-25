pragma solidity ^0.4.0;
contract helloworld {
    /*uint public balance;*/
    //mapp address to balances
    address public owner;
    mapping (address => uint) balances;

    //whoever access contract make them owner
    //give a starting balance
    function helloworld(){
        /*balance = 1000;*/
        owner = msg.sender;
        balances[owner] = 1000;
    }

    function transfer(address _to, uint _value) returns (bool success){
      if(balances[msg.sender] < _value){
          return false;
      }
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      return true;
    }

    //this function do not change blockchain
    function getBalance(address _user) constant returns(uint _balance) {
        return balances[_user];
    }
    /*function getBalance()  returns(uint) {
        return balance;
    }*/

    /*function deposit(uint _value) returns(uint _newValue){
      balance += _value;
      return balance;
    }*/
}

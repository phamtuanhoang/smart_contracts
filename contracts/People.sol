pragma solidity ^0.4.4;

contract People{
  Person[] public people;

  struct Person{
    bytes32 firstName;
    bytes32 lastName;
    uint age;
  }

  function addPerson(bytes32 _firstName, bytes32 _lastName, uint _age) returns(bool success){
    //not sure why adding memory lol
    Person memory newPerson;
    newPerson.firstName = _firstName;
    newPerson.lastName = _lastName;
    newPerson.age = _age;
    //save to blockchain
    people.push(newPerson);
    //this will cost no gas, free
    return true;
  }

  //function cant return a struct, return array instead
  //prevent looping to change state in blockain => cost gas
  function getPeople() constant returns(bytes32 [], bytes32 [],uint[]){
    uint length = people.length;
    bytes32[] memory firstNames = new bytes32 [](length);
    bytes32[] memory lastNames = new bytes32 [](length);
    uint[] memory ages = new uint [](length);

    for(uint i = 0; i < people.length; i++){
      Person memory currentPerson;
      currentPerson = people[i];
      firstNames[i] = currentPerson.firstName;
      lastNames[i] = currentPerson.lastName;
      ages[i] = currentPerson.age;
    }
    return(firstNames, lastNames, ages);

  }

}

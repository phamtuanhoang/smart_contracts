contract People{
  Person[] public people;

  struct Person{
    string firstName;
    string lastName;
    uint age:
  }

  function addPerson(string _firstName, string _lastName, uint _age) returns(bool success){
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

}

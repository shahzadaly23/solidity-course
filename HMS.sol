// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
contract HMS{
    string public Patient_name;
    uint public age;
    string public disease;
    constructor( string memory patientname, uint _age, string memory _disease){
   Patient_name= patientname;
   age = _age;
   disease= _disease;
    }

}
contract newHMS{
    HMS[] public Patient;
    constructor(string memory patientname, uint _age, string memory _disease){
        HMS patient = new HMS(patientname, _age, _disease);
        Patient.push(patient);
    }
    
    function retrive(uint index) public view returns (HMS){
        return Patient[index];
    }

}
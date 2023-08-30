// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
library Explibrary {
 function exponential( uint256 a, uint256 b) public pure returns
(uint256) {
 return a ** b ;
 }
}
contract SumContract {

 function sum( uint256 a, uint256 b) public pure returns (uint256) {
 return a + b ;
 }
}
contract LibraryClient {

 function GetExponential(uint256 firstVal, uint256 secondVal)
public pure returns(uint256) {
 return Explibrary.exponential(firstVal, secondVal);
 }
 function Sum(uint256 firstVal, uint256 secondVal) public pure 
returns(uint256) {
 
 }
}



library MathLibrary {
    function add(uint256 a, uint256 b) internal  pure returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "Subtraction result would be negative");
        return a - b;
    }

    function power(uint256 base, uint256 exponent) internal pure returns (uint256) {
        return base ** exponent;
    }
}

contract MathUser {
    using MathLibrary for uint256;

    function useMathFunctions(uint256 x, uint256 y) public pure returns (uint256 sum, uint256 difference, uint256 powered) {
        sum = x.add(y);
        difference = x.subtract(y);
        powered = x.power(y);
    }
}



contract LaptopEncoder {
    struct Laptop {
        string company;
        uint256 price;
        string colour;
    }

    function encodeLaptops(Laptop[] memory data) public pure returns (bytes memory) {
        return abi.encode(data);
    }

    function decodeLaptops(bytes memory encodedData) public pure returns (Laptop[] memory) {
        return abi.decode(encodedData, (Laptop[]));
}}


contract VotingDataEncoder {
    struct Voter {
        address voterAddress;
        uint256 voterID;
        string name;
        uint256 age;
    }

    function encodeVoterData(Voter memory voter) public pure returns (bytes memory) {
        return abi.encode(voter);
    }

    function decodeAndVerifyVoterData(bytes memory encodedData, uint256 voterIDToVerify) public pure returns (bool) {
        Voter memory decodedVoter = abi.decode(encodedData, (Voter));
        return decodedVoter.voterID == voterIDToVerify;
    }
}




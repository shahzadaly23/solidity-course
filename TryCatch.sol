// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimeChecker{
 constructor(uint a){
 require(a != 0, "Invalid Entry");
 assert(a != 1);
 }
 function isPrime(uint256 b) internal pure returns (bool) {
 if (b <= 1) {
 return false; }
 if (b == 2) {
 return true; }
 if (b % 2 == 0) {
 return false; }
 for (uint256 i = 3; i * i <= b; i += 2) {
 if (b % i == 0) {
 return false; }
 }
 return true;
}
function onlyPrime(uint256 b) external pure returns (bool success) {
 // revert when a non-prime number is entered
 require(isPrime(b), "Ups! Reverting");
 success = true; }
}

contract TryCatch {
 // success event
 event SuccessEvent();
 // failure event
 event CatchEvent(string message);
 event CatchByte(bytes data);
 PrimeChecker even;
 constructor() {
 even = new PrimeChecker(2);
 }
 
    function execute(uint amount) external returns (bool success) {
 
 try even.onlyPrime(amount) returns(bool _success){
 emit SuccessEvent();
 return _success;
 } catch Error(string memory reason){
 // if call fails
 emit CatchEvent(reason);
 }
 }
    
function executeNew(uint a) external returns (bool success) {
 
 try new PrimeChecker(a) returns(PrimeChecker _even){
 // if call succeeds
 emit SuccessEvent();
 success = _even.onlyPrime(a);
 } catch Error(string memory reason) {
 emit CatchEvent(reason);
 }
 catch (bytes memory reason) {
 emit CatchByte(reason);
 }
 }
}






contract SimpleDivision {
    function divide2Nums(uint256 numerator, uint256 denominator) public pure returns (uint256) {
        require(denominator != 0, "Denominator cannot be zero");
        return numerator / denominator;
    }
}

contract trycatch {
    SimpleDivision public simpleDivisionContract;

    constructor(address _simpleDivisionAddress) {
        simpleDivisionContract = SimpleDivision(_simpleDivisionAddress);
    }

    function Errors(uint256 numerator, uint256 denominator) public view returns (uint256 result, bool success) {
        try simpleDivisionContract.divide2Nums(numerator, denominator) returns (uint256 _result) {
            result = _result;
            success = true;
        } catch Error(string memory /*reason*/) {
            // Error occurred in the called function
            success = false;
    }
}}

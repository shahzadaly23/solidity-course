// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDivision {
    function divide2Nums(uint256 numerator, uint256 denominator) public pure returns (uint256) {
        require(denominator != 0, "Denominator cannot be zero");
        return numerator / denominator;
    }
}

contract TryCatchExample {
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

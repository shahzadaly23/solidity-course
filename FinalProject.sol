// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
library Safemath{
    function multiplt(uint256 a, uint256 b)internal pure returns(uint256){
      if(a==0){
          return 0;
      }
      uint256 c = a * b;
      assert(c/a == b);
      return c;

    }

    function divide(uint256 a, uint256 b) internal pure returns(uint256){
        uint256 c = a/b;
        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns(uint256){
        assert(b >= a);
        return a-b;
    }
    function add(uint256 a, uint256 b) internal pure returns(uint256){
       uint256 c = a+b;
       assert(c >= a);
       return c;
    }

}
contract ownable{
    
}
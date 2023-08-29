// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract marketplace{
    mapping ( address=> uint) balance;
    event purchase(address indexed buyer_address, address indexed sender_address,uint value);
    function register(address youraddress, uint initial_bal) public {
        require( initial_bal!= 0, "value can't be zero");
        balance[youraddress] = initial_bal; 
    }
    function buy(address sender, address buyer, uint C_P) public virtual { 
    require(balance[sender] != 0, "please register first");
    require(balance[buyer] !=0, "please register first");
    balance[sender] += C_P;
    balance[buyer] -= C_P;

    emit purchase(buyer, sender, C_P );
}    
    error custom(string reason);
    function sell(address sender, address buyer, uint S_P) public virtual  returns(string memory){
    require(S_P != 0);
    if (balance[sender] == 0){
        revert custom( "seller is not registered");
    }
    else if (balance[buyer] == 0){
        revert custom ("buyer is not registered");
    }
    else if(balance[sender] == balance[buyer]){
        revert custom ("seller and buyer cant be one person");
    }
    else if (balance[sender] == 0 && balance[buyer] == 0){
        revert custom ("seller and buyer both are not registered");

    }
    return ("item will be shipped to the buyer address");

    }
}
contract PremiumSeller is marketplace{
    uint public feepercentage;
    constructor(uint _feepercentage){
     feepercentage = _feepercentage;
    }
    function sell(address sender, address buyer, uint S_P) public virtual override returns(string memory) {
    require(balance[sender] == 0, "your balance is zero");
    uint fee = S_P * feepercentage / 100;
    balance[sender] -= fee;
    balance[address(this)] += fee;

    super.sell(sender,buyer,S_P);
    return ("item will be sent to your address");
    }

}
contract RegularBuyer is marketplace{

}
contract VIP_buyer is marketplace{
    uint public discount;
    uint public finalAmount;
    constructor(uint dispercentage){
        discount = dispercentage;
    }

    function buy(address sender, address buyer, uint C_P) public virtual override {
        require(balance[sender] != 0," seller is not registered");
        require(balance[buyer] != 0," buyer is not registered");
        require(C_P != 0, " cost cant be zero");

        finalAmount = C_P * discount/100; 
        balance[sender] += finalAmount;
        balance[buyer] -= finalAmount; 

        emit purchase(buyer, sender, finalAmount);
       

    }

}
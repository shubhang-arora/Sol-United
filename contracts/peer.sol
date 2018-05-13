pragma solidity ^0.4.17;


contract Peer {
    int[] public consumptions;
    int[] public productions;
    address[] public sellers;
    address[] public buyers;
    
      
    function setConsumtion(int newConsumption) public {
        consumptions.push(newConsumption);
    }

    function setProduction(int newProduction) public {
        productions.push(newProduction);
    }
    
    function deficit(uint index) public view returns (bool){
        return (consumptions[index] > productions[index]);
    }
    
    function excess(uint index) public view returns (bool) {
        return (consumptions[index] < productions[index]);
    }
    
    function getBorrowAmount(uint index) public view returns (int) {
        return (consumptions[index] - productions[index]);
    }
    
    function getLendAmount(uint index) public view returns (int){
        return (productions[index] - consumptions[index]);
    }
    
    function getConsumptions() public view returns (int[]) {
        return consumptions;
    }
    
    function getProductions() public view returns (int[]) {
        return productions;
    }
    
    function setSellers(address seller) public {
        sellers.push(seller);
    }
    
    function setBuyers(address buyer) public {
        buyers.push(buyer);
    }
    
    function getSellers() public view returns (address[]) {
        return sellers;
    }
    
    function getBuyers() public view returns (address[]) {
        return buyers;
    }

}
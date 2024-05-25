
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "./Token.sol";

contract Deposit {
    
    uint256 public cost = 1 ether;
    uint256 public transferAmount = 100;



    event Deposit(
        address indexed token,
        address indexed sender
    );

    constructor(){}

    function depositETH(address _token, address payable _sender) public payable returns(bool){
        // Ensure the sent value meets the cost requirement
        require(msg.value == cost, "Deposit: Cost not met");

        // Transfer the transferAmount to the contract itself or another designated address
        // Assuming the Token contract has a function to transfer tokens to the contract
        // Replace 'this' with the address of the contract if needed
        Token(_token).transfer(_sender, transferAmount);

        // Emit the Deposit event
        emit Deposit(_token, _sender);

        // Return true to indicate success
        return true;
    }
}

// pragma solidity ^0.8.9;

// import "hardhat/console.sol";
// import "./Token.sol";

// contract Deposit {
    
//     uint256 public cost = 1000000000000000000;
//     uint256 public transferAmount = 100000000000000000000;

//    event Deposit(
//     address indexed token,
//     address indexed sender
//     );

//     constructor(){}

//     function depositETH(address _token, address payable _sender) public payable returns(bool){

//         require(msg.value ==  cost,"Deposit: Cost not met");

//         Token(_token).transfer(_sender, transferAmount);

//         emit Deposit(_token, _sender);

//          bool success = true;

//          return success;
    
//     }
   
// }


//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // event Deposit(
    //     address token,
    //     address sender
    //     );
    // emit Deposit(_token, _sender);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // constructor (uint256 _cost, uint256 _transferAmount) {
    //     cost = _cost;
    //     transferAmount = _transferAmount;
    // }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // mapping(address => uint256) public balanceOf;
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // event Deposit(
    //     address indexed token,
    //     address indexed sender);
    // emit Deposit(_token, _sender);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // constructor(uint256 _cost)
    // {
    //     cost = _cost * 10 ** 18;
    //     transferAmount = cost * 100; 
    // }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

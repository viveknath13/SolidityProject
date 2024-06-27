// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {PriceConverter} from "./PriceConverter.sol";
error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    address[] public funders;

    mapping(address => uint256) public amount_Funded_thorugh_address;

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    address public immutable i_owner;
    modifier onlyowner() {
        //     require(msg.sender == i_owner, "Hey you are not the owner...");
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    constructor() {
        i_owner = msg.sender;
    }

    function getfund() public payable {
        require(
            msg.value.getconversionRate() >= MINIMUM_USD,
            "Please send enough money."
        );

        funders.push(msg.sender);
        amount_Funded_thorugh_address[msg.sender] += msg.value;
    }

    function withdraw() public onlyowner {
        for (uint256 i = 0; i < funders.length; i++) {
            address ownerOfFund = funders[i];
            amount_Funded_thorugh_address[ownerOfFund] = 0;
        }
        funders = new address[](0); //reset the array

        (bool sucess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(sucess, "call is failed");
    }
    receive() external payable {
        getfund();
     }
     fallback() external payable { 
        
     }
}


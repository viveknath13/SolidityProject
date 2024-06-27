msg.value Number of wei the user send
1 ETH = 1000000000000000000 = 1*10 **18;
using eth converter.com;
revert has undo the any action have been done and send the remaining gas
smart contract are unable to with external system data feed APIs existing payment systems any other off-chain resource on their own;
https://docs.chain.link/
int price varibale is show the price of ETH in Usd 2000.00000000 (price * 1e10)
transfer thorugh the error 2300
send thorugh 2300 gas and return bool
call thorugh forward all gas or set gas return bool
  //@transfer
        payable(msg.sender).transfer(address(this).balance); //This keyword refer to the whole contract ;
        //@send
        bool sendSucessfull = payable(msg.sender).send(address(this).balance);
        require(sendSucessfull, "sending is failed");
        //@call
        (bool sucess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(sucess, "call is failed");
what happen when some send ETH without calling the fund function how they do it : by using receive and fallback function
receive function : The receive function excuted on a call to the contract with empty calldata 

 this contract is to allow users to fund it with Ether, while also having the ability to withdraw funds if and when the owner wishes to do so.
 **import {PriceConverter} from "./PriceConverter.sol";**: This imports a library named `PriceConverter` from the local directory `"./PriceConverter.sol"` that is used for converting Ether values to USD in various functions.
**error NotOwner();**: Defines an error called `NotOwner` which will be thrown when someone who's not the owner tries to call a function with the `onlyowner` modifier.
**contract FundMe {...}**: This is the main contract definition. It contains several functions and variables that are relevant to its functionality.
**using PriceConverter for uint256;**: This line makes the `getconversionRate()` function of the `PriceConverter` library available as a method on `uint256` types in this contract.
**address[] public funders; mapping(address => uint256) public amount_Funded_thorugh_address;**: These lines define two public variables. The first one is an array of addresses that have funded the contract, and the second one is a mapping from addresses to the total amount they've funded.
**uint256 public constant MINIMUM_USD = 50 * 1e18;**: This line defines a constant for the minimum USD value required to fund the contract (50 Dollars).
**address public immutable i_owner; modifier onlyowner() {...}**: Here, an owner of the contract is defined as the person who deployed it and can only withdraw funds if they are the owner. The `onlyowner` function modifier restricts certain functions to be callable only by the owner.
 **constructor() { i_owner = msg.sender; }**: This line sets the owner of the contract when a new instance is created (i.e., during deployment).
 **function getfund() public payable {...}**: Allows users to fund the contract with Ether, and stores information about who funded what amount in the `funders` array and `amount_Funded_thorugh_address` mapping.
 **function withdraw() public onlyowner {...}**: This function allows the owner of the contract to withdraw all funds from it to their own address.. **receive() external payable { getfund(); } fallback() external payable {}**: These are special functions that handle incoming transactions and Ether directly sent to the contract without calling a specific function (fallback). The `getfund()` function is called in both these cases
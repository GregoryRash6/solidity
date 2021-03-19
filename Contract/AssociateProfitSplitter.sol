// Designate Solidity Version
pragma solidity ^0.5.0;

// Equal Split
contract AssociateProfitSplitter {

    // Create Payable Address for Employee One
    address payable employee_one;

    // Create Payable Address for Employee Two
    address payable employee_two;

    // Create Payable Address for Employee Three
    address payable employee_three;

    // Create Constructor 
    constructor(address payable _one, address payable _two, address payable _three) public {

        // Set Employee One 
        employee_one = _one;

        // Set Employee Two
        employee_two = _two;

        // Set Employee Three
        employee_three = _three;
    }

    // Create Balance Function 
    function balance() public view returns(uint) {

        // Return Balance 
        return address(this).balance;
    }

    // Create Deposit Function 
    function deposit() public payable {

        // Split `msg.value` into Three
        uint amount = msg.value/3; // Your code here!

        // Transfer 1/3 to Employee One
        employee_one.transfer(amount);

        // Transfer 1/3 to Employee Two
        employee_two.transfer(amount);

        // Transfer 1/3 to Employee Three
        employee_three.transfer(amount);

        // Take Care of a Potential Remainder
        msg.sender.transfer(msg.value-amount*3);
    }

    // Crete Fallback Function 
    function() external payable {
        // Enforce Deposit Function
        deposit();
    }
}

#!/bin/tclsh


# Write a TCL program that defines 3 variables operand1, operand2 and result,
# and:
# 1. set the value of operand1 e operand2 (set command)
# 2. calculate the sum of the values and save it in the variable result
# 3. display on the screen the value of variable result using the function puts
#
#

set operand1 10;
set operand2 5;

set result [expr $operand1 + $operand2];

puts "the result of the sum of operand1 = $operand1 and operand2 = $operand2 is $result!";

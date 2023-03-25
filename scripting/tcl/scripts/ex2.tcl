#!/bin/tclsh
#
#Write a TCL program to determine if the second degree equation (ax2 + bx + c = 0)
#has real solution, and in this case print the results on the screen.
#Specifically:
# 1. define three variables a, b and c, corresponding to the coefficients of the
#    equation, and two variables x1 and x2 to store the solutions of the equation#
# 2. set the values of a, b and c
# 3. calculate the discriminant (delta) of the solution
#   3.3.1. In case delta is positive, use function sqrt to obtain the value of x
#   3.3.2. Otherwise, display on the video a message to advice that the
#          equation has no real solutions

puts "Let's compute ax^2 + bx + c = 0";
puts "put a = ";
gets stdin a;

puts "put b = ";
gets stdin b;

puts "put c = ";
gets stdin c;


set delta [expr pow($b, 2) - 4 * $a * $c];

puts "the delta is $delta";

if {$delta > 0} {
    set result [expr ( sqrt($delta) - $b)/(2* $a)];
    puts "$result";
} else {
    puts "Has not real solution";
}

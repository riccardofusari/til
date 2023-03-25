#!/bin/tclsh

#Write a TCL program to:
#  1. create a new list variable containing the numbers from 0 to 10 (using the
#     lappend command)
#  2. displays the content of the list, one item per line (using the foreach
#     command)
#  3. calculate the sum of the 5th and 10th element in the list and append the
#      result at the end of the list itself
#  4. displays on the screen the last item of the list
#

set x [list];

for {set y 0} {$y <= 10} {incr y} {
    lappend x $y
}

foreach number $x {
    puts "the number is $number";
}

set result [expr [lindex $x 5] + [lindex $x 10]];

lappend x $result;


puts "the final result is [lindex $x 11]";


# The foreach command assign an element of the list to number
# set listofnumber [list 1 2 3 4 5]
# foreach number $listofnumber {
# puts "The number is $number"
# }

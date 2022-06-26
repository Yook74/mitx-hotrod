use <fan.scad>
use <power_board.scad>
use <motherboard.scad>
use <power_button.scad>
use <ssd.scad>


motherboard();
translate([50, 30, 35]) fan();
translate([12, 190, 0]) power_board();
translate([170, 100, -12]) rotate([0, 0, -90]) power_btn();
translate([0, 170, -20]) rotate([0, 0, -90])  ssd();
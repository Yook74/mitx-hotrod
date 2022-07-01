include <power_board.scad>
include <motherboard.scad>
include <base.scad>
include <standoffs.scad>
use <fan.scad>
use <power_button.scad>
use <ssd.scad>

echo(power_board_hole_pos);
pwrbrd_hole_abs = [ 
    for (pos=power_board_hole_pos) pos + [pwr_board_offset, pwr_board_space + d1 + power_board_hole_offset[1]]];

echo(pwrbrd_hole_abs);

motherboard();
translate([50, 30, 35]) fan();
translate(pwrbrd_hole_abs[0] - power_board_hole_offset) power_board();
translate([170, 100, 50]) rotate([0, 0, -90]) power_btn();
translate([ssd_offset[0] + 6, ssd_offset[1] + 96.5, -short_height]) rotate([0, 0, -90])  ssd();
translate([0, 0, -short_height - base_thick]) base();

translate([0, 0, -short_height]){
    for (pos=mobo_hole_pos) translate(pos + mobo_hole_offset) short_standoff();
    for (pos=pwrbrd_hole_abs) translate(pos) short_standoff();
}
include <motherboard.scad>
include <power_board.scad>
include <ssd.scad>

base_thick = 3;
base_width = 25;
mount_hole_r = 1.8;
mount_hole_countersink_r = 3;
pwr_board_space = 15;
pwr_board_offset = 16;
ssd_offset = [12, 62];

hole_pos = concat(
    mobo_hole_pos, 
    [for (pos=power_board_hole_pos) pos + [pwr_board_offset, 170 + 15 + pwr_board_space] - mobo_hole_offset],
    [for (i=[2, 3]) [ssd_hole_pos[i][1] + ssd_offset[0], ssd_hole_pos[i][0] + ssd_offset[1]]]
);
    
corner_pos = [hole_pos[0], hole_pos[5], hole_pos[1], [0, hole_pos[4][1]]];

module hole(pos) translate(pos) {
    cylinder(base_thick, r=mount_hole_r);
    cylinder(2, mount_hole_countersink_r, 0);
}
module corner(pos) translate(pos) cylinder(base_thick, r=base_width/2);

module holes() for(pos = hole_pos) hole(pos);


module base_material() {
    for(pos = corner_pos) corner(pos);
    translate([-base_width/2, 0]) cube([base_width, corner_pos[1][1], base_thick]);
    translate([-base_width/2 + corner_pos[2][0], 0]) cube([base_width, corner_pos[1][1], base_thick]);
    
    difference() {
        curve_radius = 80;
        cube([corner_pos[1][0], corner_pos[1][1] + base_width / 2, base_thick]);
        
        translate([corner_pos[2][0] / 2, 50]) 
            cylinder(base_thick, r=curve_radius);
        
        cube([corner_pos[2][0], 40, base_thick]);
    }
}

module base(){
    translate([10, 6.35]) difference(){
        base_material();
        holes();
    }
}
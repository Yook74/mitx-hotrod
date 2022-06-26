include <motherboard.scad>
include <power_board.scad>
include <ssd.scad>

base_thick = 3;
base_width = 25;
mount_hole_r = 2;
pwr_board_space = 15;
pwr_board_offset = mobo_hole_pos[1][0] - power_board_hole_pos[1][0];
ssd_offset = [-5, 60];

hole_pos = concat(
    mobo_hole_pos, 
    [for (pos=power_board_hole_pos) pos + [pwr_board_offset, 160 + 15 + pwr_board_space]],
    [for (pos=ssd_hole_pos) pos + ssd_offset]
);
    
corner_pos = [hole_pos[0], hole_pos[5], hole_pos[1], [0, hole_pos[4][1]]];

module hole(pos) translate(pos) cylinder(base_thick, r=mount_hole_r);
module corner(pos) translate(pos) cylinder(base_thick, r=base_width/2);

module holes() for(pos = hole_pos) hole(pos);


module base_material() {
    for(pos = corner_pos) corner(pos);
    translate([-base_width/2, 0]) cube([base_width, corner_pos[1][1], base_thick]);
    translate([-base_width/2 + corner_pos[2][0], 0]) cube([base_width, corner_pos[1][1], base_thick]);
    
}

module base(){
    translate([10.16, 5.35]) difference(){
        base_material();
        holes();
    }
    
}

echo(hole_pos[4][1] - hole_pos[2][1]);
base();
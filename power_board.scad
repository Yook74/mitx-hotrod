power_board_hole_pos =  [
    [0, 0],
    [149, 0]
];

module power_board(){   
   module board(){
        translate([0, 0, -2]) linear_extrude(28.5) difference(){
            square([156.3, 29.5]);
            square([5, 10.5]);
        }
    }


    difference(){
        board();
       
        translate([0, 25.5, 7]) rotate([0, 90]) cylinder(13, 3, 3);
        
        translate([0, 29.5 / 2 - 8.5 / 2, -2]) cube([8.5, 8.5, 2]);
        translate([147.8, 29.5 / 2 - 8.5 / 2, -2]) cube([8.5, 8.5, 2]);
        translate([147.8, 29.5 / 2 - 8.5 / 2, 1.5]) cube([8.5, 8.5, 30]);
        translate([0, 29.5 / 2 - 8.5 / 2, 1.5]) cube([8.5, 8.5, 30]);
        
        translate(power_board_hole_pos[0] + [4.6, 15]) cylinder(1.5, 1.5, 1.5);
        translate(power_board_hole_pos[1] + [4.6, 15]) cylinder(1.5, 1.5, 1.5);
    }
}
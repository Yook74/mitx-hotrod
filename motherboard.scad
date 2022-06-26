d1 = 170; // length and width of board
mobo_pcb_thick = 1.7; // PCB thickness
mobo_hole_pos = [
    [0, 0],
    [155, 0],
    [22.9, 157.5],
    [155, 157.5],
];


module motherboard_pca(){
    color("darkgrey") 
    translate([0, 0, -2]) linear_extrude(13) difference(){
        square([d1, d1]);
        
        square([16, 10.5]);
        translate([160, 0]) square([10, 10.5]);
        translate([29, d1-10.5]) square([8, 10.5]);
        translate([170-8, d1-10.5]) square([8, 10.5]);
    }
    
    color("green") difference(){
        cube([170, 170, mobo_pcb_thick]);
        
        for (pos = mobo_hole_pos)
            translate([10, 6.35] + pos) cylinder(mobo_pcb_thick, r=2);
    }
}

module ram(y_pos){
    translate([24.5, y_pos]) rotate([90]) linear_extrude(4.5){
        square([142.5, 20]);
        translate([6, 0]) square([133, 32]);
    }
}

module motherboard(){
    motherboard_pca();
    
    translate([0, 0, mobo_pcb_thick]){
        color("white") translate([97, d1 - 12]) cube([62, 12, 30]);
        color("orangered") translate([70, 44]) cube([55, 60, 17]);

        color("black") ram(110);
        color("blue") ram(120);
        color("black") ram(130);
        color("blue") ram(140);

        color("silver"){
            translate([0, d1-(19 + 4)]) cube([27, 19, 31]);
            translate([0, 82]) cube([28, 17, 27]);
            translate([0, 59]) cube([41, 17, 27]);
            translate([13.6, 38]) cube([19, 19, 31]);
            translate([61-11, 60]) cube([11, 23, 23.5]);
        }
        
        color("blue") translate([-7, 24]) cube([10, 29, 9.5]);
    }
}
screw_r = 1.25;


difference(){
    body();
    translate([0, 0, 5]) rotate([0, 90, 0]) 
        linear_extrude(7) translate([0, 20, 0]) square([5, 45]);
    
    translate([12.5 + screw_r, 2.5 + screw_r, 0]) cylinder(3.5, screw_r, screw_r);
    translate([12.5 + screw_r, 64.5 + screw_r, 0]) cylinder(3.5, screw_r, screw_r);
    translate([92 + screw_r, 64.5 + screw_r, 0]) cylinder(3.5, screw_r, screw_r);
    translate([92 + screw_r, 2.5 + screw_r, 0]) cylinder(3.5, screw_r, screw_r);
}

module body() {
    linear_extrude(6.5)
        square([100, 69.8]);
}


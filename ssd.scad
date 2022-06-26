ssd_hole_pos = [[0, 0], [0, 61.72], [76.6, 0], [76.6, 61.72]];

module ssd(){
    screw_r = 1.25;


    difference(){
        body();
        translate([0, 0, 5]) rotate([0, 90, 0]) 
            linear_extrude(7) translate([0, 20, 0]) square([5, 45]);
        
        for (pos = ssd_hole_pos)
           translate(pos + [12.5 + screw_r, 2.5 + screw_r]) cylinder(3.5, r=screw_r); 
    }

    module body() {
        linear_extrude(6.5)
            square([100, 69.8]);
    }

}

ssd();
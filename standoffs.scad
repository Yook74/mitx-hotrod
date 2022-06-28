
module short_standoff(){
    difference(){
        linear_extrude(15.7) polygon([
            [-3, -1.7], [-3, 1.7], [0, 3.5], 
            [3, 1.7], [3, -1.7], [0, -3.5]
        ]);
        cylinder(15.7, r=1.5);
    }
}

module tall_standoff(){
    difference(){
        linear_extrude(31.6) polygon([
            [-2.25, -1.3], [-2.25, 1.3], [0, 2.55], 
            [2.25, 1.3], [2.25, -1.3], [0, -2.55]
        ]);
        translate([0, 0, 1.6]) cylinder(30, r=1.5);
    }
    translate([0, 0, -6.2]) cylinder(6.2, r=1.3);
}

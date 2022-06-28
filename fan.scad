$fn = 200;


fan_hole_pos = [[0, 0], [0, 70], [70, 0], [70, 0]];

module fan(){
    difference(){
        union(){
            difference(){
               cube([80, 80, 4]);
                
               for (pos=fan_hole_pos) 
                   translate(pos + [5, 5]) cylinder(4, r=2);
            }
            translate([40, 40]) cylinder(25, 45, 45);
        }
        translate([40, 40]) cylinder(25, 87 / 2, 87 / 2);
    }

    translate([40,40]) cylinder(25, 32.7/2, 32.7/2);

    // while you did something reasonable with your Saturday, I modeled the blade
    module blade(rotation){
        radius_inner = 60;
        radius_outer = 35;
        z = -15;
        x = -43;
        
        translate([40, 40]) rotate([0, 0, rotation - 25]) {
            intersection(){
                cylinder(25, 42, 42);
                
                translate([x, 0, z]) rotate([-90]) difference(){
                    cylinder(45, radius_inner, radius_outer);
                    cylinder(45, radius_inner - 1.5, radius_outer - 1.5);
                }
            }
        }
    }

    for (i=[0:6]) blade(365 * i / 7);

}
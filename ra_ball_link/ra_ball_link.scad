$fn=64;

module link_end() {
    difference() {
        hull() {
        cylinder(h=3, r=4, center=true);
        translate([6,0,0])
            cube([12,4,3], center=true);
        }
    
        sphere(d=6);
    }
}

//Left end
link_end();

//Right end
translate([80,0,0])
    mirror([-10,0,0])
        link_end();

//Center
translate([12,-2,-1.5])
    cube([56,4,3]);

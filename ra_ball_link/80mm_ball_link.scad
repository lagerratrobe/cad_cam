$fn=64;

module link_end() {
    
    difference() {
        hull() {
        cylinder(h=4, r=4.2, center=true);
        translate([6,0,0])
            cube([12,4,4], center=true);
        }
        sphere(d=6.2);
        
        cylinder(h=10, d=5.4, center=true);
    }
}

//Left end
link_end();

//Right end
translate([80,0,0])
    mirror([-10,0,0])
        link_end();

//Center
translate([12,-2,-2])
    cube([56,4,4]);

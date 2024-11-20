$fn=24;

difference() {
translate([15,0,0])
cube([30,12,4], center=true);

// socket 1 with 6mm 
translate([10,0,0])
    sphere(d=6.2);

translate([10,0,0])
cylinder(h=10, d=5.4, center=true);
    
}


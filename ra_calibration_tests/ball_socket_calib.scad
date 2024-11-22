$fn=24;

difference() {
translate([20,0,0])
cube([40,15,5], center=true);

// socket 1 with 6mm 
translate([10,0,0])
    sphere(d=6);

translate([10,0,0])
cylinder(h=10, d=5, center=true);
    
// socket 1 with 6.2mm 
translate([20,0,0])
    sphere(d=6.2);

translate([20,0,0])
cylinder(h=10, d=5, center=true);
    
// socket 1 with 6.4mm 
translate([30,0,0])
    sphere(d=6.4);

translate([30,0,0])
cylinder(h=10, d=5, center=true);
    
}
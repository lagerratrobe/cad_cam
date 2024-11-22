$fn=64;

difference() {
cube([50,15,5]);

translate([10,7.5,-1])
    cylinder(h=7,d=10);

translate([25,2.5,2])    
    cube([26,10,6]);
}

translate([2.5,.75,4])
rotate(90)
linear_extrude(1.25)
    scale([.15,.15,1])
    text("|----15mm----|", 
    font="DejaVu Sans:style=Book");

translate([20,1.75,4])
rotate(90)
linear_extrude(1.25)
    scale([.15,.15,1])
    text("|--10mm--|", 
    font="DejaVu Sans:style=Book");
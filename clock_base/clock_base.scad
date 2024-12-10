// Clock Base
use <BOSL/shapes.scad>
$fn=64;

difference() {
//cube([120,50,10], center=true);
cuboid([120,50,10], fillet=2);

//4mm bolt hole
cylinder(h=12,d=4.2, center=true);

// Bolt head
translate([0,0,-6]) cylinder(h=5,d=8.2);
    
// Clock body
translate([0,27,63])
  rotate([90,0,0])
  cylinder(h=54,d=120, $fn=200);
}


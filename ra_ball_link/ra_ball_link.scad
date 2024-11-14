$fn=64;


difference() {
hull() {
cylinder(h=3, r=4, center=true);
translate([6,0,0])
    cube([12,4,3.75], center=true);
}
sphere(d=6);
}
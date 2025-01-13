//test hub
$fn=100;

module hub() {
    cylinder(h=8,d=25.9);
    cylinder(h=3,d=35);
}

module axle() {
    translate([0,0,-1])
      cylinder(h=10, d=12);
}

difference() {
  hub();
  
    axle();
}
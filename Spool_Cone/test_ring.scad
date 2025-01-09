// 30mm holder diam
// 37mm rod_lip
// 65mm max spool size

clearance=.3;

$fn = 64;

module test_ring() {
  difference() {
    cylinder(h=5, d=50);

  translate([0,0,-.5])
    cylinder(h=6, d=37);
  }
}

module rod() {
    translate([0,0,-.5])
      cylinder(d=30+clearance, h=50);
}

module cone() {
translate([0,0,7])
  cylinder(h=25, d1=44, d2=65);

cylinder(h=7, d=37);
    
translate([0,0,32])
    cylinder(h=7, d=37);
}

module half() {
    translate([0,-32.5,-.5])
    cube([65,65,66]);
}

module spool_half() {
    difference() {
      cone();
      rod();
      half();
  }
}

module lock_ring() {
  difference() {
    translate([0,0,.25])
      cylinder(d=44, h=6.5);
  // minus...
    translate([0,0,0])
      cylinder(h=7, d=37+clearance);
  }
}

spool_half();
lock_ring();
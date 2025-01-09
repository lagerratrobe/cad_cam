// 30mm holder diam
// 37mm rod_lip
// 65mm max spool size

clearance=.7;

$fn = 128;

module rod() {
    translate([0,0,-.5])
      cylinder(d=30+clearance, h=50);
}

module cone() {
  cylinder(h=5, d=37);
    
translate([0,0,5])
  cylinder(h=15, d1=52, d2=63);
    
translate([0,0,20])
    cylinder(h=5, d=37);
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
      cylinder(d=51, h=4.5);
  // minus...
    translate([0,0,0])
      cylinder(h=7, d=37+0.6);
  }
}

//spool_half();
lock_ring();
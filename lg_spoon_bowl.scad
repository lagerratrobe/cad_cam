// Semi-circular "bowl"

//Flattened sphere
module bowl() {
  scale([1, .6, .4])
    sphere(r=57, $fn=64);
  }

// "tool" shaped like inverse of the cutout
module cutter() {
  difference() {
    bowl();
    }
  }

// piece of wood we want to cut into
module stock() {
  cube([110,110,20], true);
  }

// Subtract the cutter from stock
difference() {
  stock();
  translate([0,0,17]) cutter();
  }

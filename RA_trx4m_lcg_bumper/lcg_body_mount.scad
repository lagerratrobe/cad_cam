
module rail_end() {
   cube([3.2,12,6.5]); //rail
}

module pin() {
  rotate([0,90,0])
  cylinder(d=2, h=7, $fn=24);
}

module chassis() {
translate([39,0,0]) //left_rail
  rail_end(); 
translate([-3.2,0,0]) //right_rail
  rail_end(); 
}



difference() {
hull() {
translate([-4.8,.2,0.1])
    cube([6.4,6,6.5]);

translate([-3.2,.2,6.5])
    cube([3.2,6,2]);
}

chassis();
}
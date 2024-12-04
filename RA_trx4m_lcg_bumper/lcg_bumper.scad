




//rail end
module rail_end() {
  difference() {
   cube([3,12,6.4]); //rail

  translate([-.5,2,3.2]) //hole 1
  rotate([0,90,0])
  cylinder(d=2, h=4, $fn=24);

  translate([-.5,7,3.2]) //hole 2
  rotate([0,90,0])
  cylinder(d=2, h=4, $fn=24);
}
}

module chassis() {
translate([39,0,0]) //left_rail
  rail_end(); 
translate([-3,0,0]) //right_rail
  rail_end(); 
}

chassis();

translate([-5,-12,0])
cube([50,10,8]);
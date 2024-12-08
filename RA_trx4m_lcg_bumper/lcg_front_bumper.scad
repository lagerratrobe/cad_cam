/*Rail is:
6.4 tall
3 thick
*/
module rail_end() {
   cube([3.2,12,6.5]); //rail
/*
  translate([-.5,2,3.2]) //hole 1
  rotate([0,90,0])
  cylinder(d=2, h=4, $fn=24);

  translate([-.5,7,3.2]) //hole 2
  rotate([0,90,0])
  cylinder(d=2, h=4, $fn=24);
*/
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
//Bumper
translate([-5,-1.5,.01]) cube([49,11,8]);

//pins
translate([-5.5,7.2,3.2])
  pin();
translate([-5.5,2.5,3.2])
  pin();
translate([37.5,7.2,3.2])
  pin();
translate([37.5,2.5,3.2])
  pin();

chassis();

//Servo clearance    
translate([19.5,16,-.5]) cylinder(d=20, h=10, $fn=64);
}


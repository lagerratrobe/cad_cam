use <Round-Anything-master/roundAnythingExamples.scad>

/*Rail is:
6.4 tall
3 thick
*/
module rail_end() {
   cube([3.2,12,7.5]); //rail
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

module battery_tray() {
translate([0,9.5,0]) 
  linear_extrude(2)
    shell2d(0,-4) {
      square([39, 74.5]);
        
      gridpattern(iter=50);
    }
translate([0,82,0])
  cube([39,2,7]);
}

module mounting_ear() {
  difference() {
    hull() {
      rotate([0,90,0])
      cylinder(d=8,h=2,$fn=64);
    
  translate([0,0,5])
    rotate([0,90,0])
    cylinder(d=5,h=2,$fn=64);
    }
  // Trim bottom of mounting tab
  translate([-.5,-4,-5]) cube([3,8,5]);
  //pin hole
  translate([-1,0,4.5]) 
    rotate([0,90,0]) 
    cylinder(d=2,h=4,$fn=24);
  }
}

difference() { //Pocket for rails and screws
//Bumper
translate([-5,-1.5,.01]) cube([49,11,9]);

//pins

translate([-5.5,2.7,3.6]) pin();
//translate([-5.5,7.2,3.6]) pin();

translate([37.5,2.7,3.6]) pin();
//translate([37.5,7.2,3.6]) pin();

chassis();
}

//Battery tray floor
//translate([0,9.5,0]) cube([39,67.5,2]);
battery_tray();
translate([0,71.5,0]) mounting_ear();
translate([37,71.5,0]) mounting_ear();




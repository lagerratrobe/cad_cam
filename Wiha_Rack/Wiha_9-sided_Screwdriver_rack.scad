//cube([55,12,16]);

module lg_nongon() {
translate([0,-.25,0])
  rotate([-90,0,0])
  cylinder(d1=9, 
           d2=12.5, 
           h=16.5, 
           $fn=8);    
}

module sm_nongon() {
translate([0,-.25,0])
  rotate([-90,0,0])
  cylinder(d1=8, 
           d2=12, 
           h=16.5, 
           $fn=8);    
}

module beam() {
translate([0,0,-8])  
  cube([55,12,16]); //Test Beam
}

difference() {
beam();
  translate([20,0,0]) lg_nongon();
  translate([35,0,0]) lg_nongon();
}
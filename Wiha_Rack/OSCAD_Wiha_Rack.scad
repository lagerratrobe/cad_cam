use <MCAD/regular_shapes.scad>

module lg_hex() {
 rotate([90,22.5,0]) linear_extrude(24) {
     octagon(5.375);
 }
;   
}

module med_hex() {
  rotate([90,22.5,0]) linear_extrude(24) {
     octagon(4.8);
 }
;   
}

difference() {
//cube([120,12,16]);
cube([55,12,16]); //Tack Beam
translate([20,18,8]) lg_hex();
translate([35,18,8]) lg_hex();
translate([49,18,8]) med_hex();    
}
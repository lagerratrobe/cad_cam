
module sm_hook() {
    difference() {
    rotate([0,0,90])
    import("/home/randre/Documents/Code/cad_cam/Baker_Rack_Hook/Wire_Rack_Hook_v4.stl", convexity=3);
 
  translate([20,-38,-.5]) 
  cube([40,35,15]);
  }
}

module lg_hook() {
    difference() {
    rotate([0,0,90])
    import("/home/randre/Documents/Code/cad_cam/Baker_Rack_Hook/Wire_Rack_Hook_v4.stl", convexity=3);
 
  translate([-20,-25,-.5]) 
  cube([40,35,15]);
  }
}

sm_hook();

translate([-10,0,0])
  lg_hook();



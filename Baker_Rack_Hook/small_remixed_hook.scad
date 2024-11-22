
module hook() {
    difference() {
    rotate([0,0,90])
    import("/home/randre/Documents/Code/cad_cam/Baker_Rack_Hook/Wire_Rack_Hook_v4.stl", convexity=3);
 
  translate([20,-38,-.5]) 
  cube([40,35,15]);
  }
}

hook();

translate([35,-9.75,0])
mirror([0,1,0])
mirror([1,0,0])
  hook();
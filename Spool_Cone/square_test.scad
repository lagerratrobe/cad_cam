// Dimension test

difference() {
cube([30,30,3], center=true);

linear_extrude(2)
  translate([6,-14,1.5])
  #text(text="X", size=7.0);

linear_extrude(2)    
translate([-13,7,1.5])
  #text(text="Y", size=7.0);
}
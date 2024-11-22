$fn=100;

/* wheel specs:
outer rim diam = 29
bead_diam = 26mm
rim height = 15mm
rim wall = 2mm
lip = 1.2mm thick x 1.5mm
*/
module Hex_Prism(d,h) {
	difference() {
		cylinder (r=1*d,h=h,center=true);
		union() {
			for (i=[0:1:5]) {
				rotate([0,0,i*60]) translate([d,0,0]) cube([d,1.1*d,1.01*h], center=true);
			}
		}
	}
}

module lip() {
    cylinder(h=1.2, d=29);
}

module wheel_solid() {
  cylinder(h=15, d=26);
  lip();

  translate([0,0,4.7])
  lip();

  translate([0,0,9.1])
  lip();

  translate([0,0,13.8])
  lip();
}

module wheel_hub() {
  difference() {
  cylinder(h=13, d=13);
  
  Hex_Prism(8,4);
  
  cylinder(h=14,d=3.5); //Axle
  
  translate([0,0,8]) // Wheel nut
  cylinder(h=5.5, d=8.2);
  
  }
}

module wheel_rim() {
  difference() {
    wheel_solid();
    // remove center leaving 2mm
    translate([0,0,-0.5])
      cylinder(h=16, d=22);
  }
}

module dish_cut() {
    difference() {
    cylinder(h=33,d=64);
    translate([0,0,-.5])
      cylinder(h=34,d=26);    
    }
}

module dish() {
  difference() {
    sphere(32);
    
      translate([0,0,32])
        cube(64, center=true);
  
      sphere(30); //Create 2mm wall
    
      translate([0,0,-33]) //cut inner wall
        cylinder(h=13, d=13);
    
      translate([0,0,-32]) // cut outer wall
        dish_cut();
      
      spokes();
  }
}

module spokes() {
  //Cuts dish
  translate([0,8.7,-34])
  cylinder(h=13, d=4);
  
  rotate([0,0,45])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);
    
  rotate([0,0,90])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);
    
  rotate([0,0,135])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);
    
  rotate([0,0,180])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);

  rotate([0,0,225])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);

  rotate([0,0,270])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);
  
  rotate([0,0,315])
   translate([0,8.7,-34])
  cylinder(h=13, d=4);
}

// Built-up wheel
wheel_rim();
wheel_hub();

translate([0,0,31.25 + 3.5])
  dish();

translate([0,0,31.25 + 10])
  dish();





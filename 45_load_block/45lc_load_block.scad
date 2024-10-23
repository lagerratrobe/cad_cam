// Base material
module block() {
  cube([186, 95, 20]);
}

//Single hole, used as origin
module hole() {
translate([12,12,6]) 
  cylinder(r=6,h=40,$fn=20);
}

//First row of holes
module row() {
  hole();
  for (i=[1:9]) {
  translate([i*18,0,0]) 
  hole();
  }
}

//Repeated rows across block
module repeats() {
  for (i=[1:4]) {
    translate([0,i*18,0])
    row();
  }
}

//Subtract hole material from block
difference() {
  block();
  row();
  repeats();
}


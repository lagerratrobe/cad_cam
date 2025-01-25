font="Montserrat:style=Black";
text="Rutabaga";

translate([0,0,0]) {
  cube([200,6,2]);
}
translate([0,3,0]) {
    cylinder(h=2, r=3, center=false, $fn = 100);
}

translate([201.729,3,0]) {
    cylinder(2,3.464,3.464,$fn=3);
}

translate([2,6,0]){
    linear_extrude(3)
        text(text, font = font, size = 15);
}

cube([100,23,2]);

translate([0,20,0])
    cylinder(r=3, h=2, center=false);


use <Round-Anything-master/roundAnythingExamples.scad>

module hub() {
    cylinder(h=8,d=26.2,$fn=100);
    cylinder(h=3,d=35);
}

module axle() {
    translate([0,0,-1])
      cylinder(h=10, d=12, $fn=100);
}


module rim() {
hub();
linear_extrude(3)
    shell2d(0,-4) {
      circle(d=125, $fn=14);
        
      gridpattern(memberW = 23, //wall thick
                    sqW = 26,   //size hole
                    iter = 2,  //hole count
                    r = 3);  //corner radius
    }
}

//Main section of code
difference() {
rim();
axle();
}


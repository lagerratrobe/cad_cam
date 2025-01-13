use <Round-Anything-master/roundAnythingExamples.scad>

linear_extrude(3)
    shell2d(0,-4) {
      circle(d=125);
        
      gridpattern(memberW = 23, //wall thick
                    sqW = 25,   //size hole
                    iter = 2,  //hole count
                    r = 5);  //corner radius
    }
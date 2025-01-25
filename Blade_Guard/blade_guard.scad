clearance = .8;

module blade() {
  linear_extrude(2.1)
  polygon(
    points=[[0,0],[16.25,0],[16.25,23.5],[0,19.5]]
    );
}

difference() {
translate([-1.3,1,-.5])
scale([1.15,1.1,1.5]) blade();

blade();
    
}
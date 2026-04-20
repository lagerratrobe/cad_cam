use <Round-Anything-master/roundAnythingExamples.scad>

// Clark-Y Airfoil Coordinates
airfoil_points = [
    // --- Upper surface: trailing edge to leading edge ---
    [1.0000,  0.0012],
    [0.9500,  0.0149],
    [0.9000,  0.0280],
    [0.8000,  0.0522],
    [0.7000,  0.0735],
    [0.6000,  0.0915],
    [0.5000,  0.1052],
    [0.4000,  0.1140],
    [0.3000,  0.1170],  // max thickness
    [0.2000,  0.1136],
    [0.1500,  0.1069],
    [0.1000,  0.0960],
    [0.0750,  0.0885],
    [0.0500,  0.0790],
    [0.0250,  0.0650],
    [0.0125,  0.0545],
    [0.0000,  0.0350],  // leading edge

    // --- Lower surface: leading edge to trailing edge ---
    // Flat bottom begins at ~x=0.30; forward of that, small positive camber
    [0.0125,  0.0193],
    [0.0250,  0.0147],
    [0.0500,  0.0093],
    [0.0750,  0.0063],
    [0.1000,  0.0042],
    [0.1500,  0.0015],
    [0.2000,  0.0003],
    [0.3000,  0.0000],  // flat bottom begins here
    [0.4000,  0.0000],
    [0.5000,  0.0000],
    [0.6000,  0.0000],
    [0.7000,  0.0000],
    [0.8000,  0.0000],
    [0.9000,  0.0000],
    [0.9500,  0.0000],
    [1.0000,  0.0000],  // trailing edge (flat bottom meets upper)
];

module wing_rib(chord, height) {
  linear_extrude(height = height) {
  shell2d(0,-2) {
      intersection() {
  scale([chord, chord, 1]) {
              polygon(points = airfoil_points);
              }
          }
  gridpattern(iter=12);
      }
  }
}

chord = 100;
height = 2;

//Cut spar slot
difference() {
wing_rib(chord, height);

translate([20,0,-1])
    cube([5,3,10]);
}
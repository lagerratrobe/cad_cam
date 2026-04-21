use <Round-Anything-master/roundAnythingExamples.scad>

include <fuse_profile_1.scad>

// Now use it
 
  linear_extrude(height = 3) {
  shell2d(0,-2) {
    fuse_profile_1();
      }
  }
//BOSL Threading Experiments

include <BOSL2/std.scad>
include <BOSL2/threading.scad>

threaded_rod(d=30, 
            h=12, 
            pitch=3, 
            $fa=1, 
            $fs=1, 
            end_len1=2.5, 
            bevel1=true,
            bevel2=false
            );

//30mm shaft
translate([0,0,6])
    cylinder(d=30, h=3, $fn=96);

translate([0,0,9])
  cylinder(d=36, h=4, $fn=96);

translate([0,0,13])  
cylinder(d=30, h=85, $fn=96);

translate([0,0,113])
threaded_rod(d=30, 
            h=30, 
            pitch=3, 
            $fa=1, 
            $fs=1, 
            end_len1=1, 
            bevel1=false,
            bevel2=true
            );
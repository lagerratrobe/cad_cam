include <BOSL2/std.scad>
include <BOSL2/threading.scad>

/*
threaded_rod(d=30, 
            h=10, 
            pitch=3, 
            $fa=1, 
            $fs=1, 
            //end_len1=1.5,
            //end_len2=1.5, 
            bevel1="reverse",
            bevel2="reverse"
            );
*/
threaded_nut(nutwidth=50, id=30.4, h=12, pitch=3, bevel=false, $slop=0.1, $fa=1, $fs=1);

/*threaded_nut(shape="square", nutwidth=50, id=30.4, h=12, pitch=3, $slop=0.1, $fa=1, $fs=1);
*/
/* [Config] */
nudgeCnt=3; // Use for example 1 for PLA, 2 for PETG and so on
drillHole=true; // Make a hole in top right corner
txtFont="Exo"; 
txtStyle="Black";
// Download font at https://fonts.google.com/specimen/Exo

/* [Text] */
txtLine1="Hatchbox";
txtLine2="True White";
txtLine3="PLA";

/* [Advanced] */
//overall dimensions
ovDims=[85,54,4.5]; 
//corner Radius
crnRad=8; 
//Dimensions of the Insert
insrtDims=[35.6,18.6,3];
//Spacing of the cavity for the insert
insrtSpcng=[0.2,0.2,0.25];
//littl cavities square dimension
cavSize=8;
//cavities radius 
cavRad=2; 
//cavities depth
cavZ=[[3,3.5,4],[1.5,2,2.5]]; //bottom left to top right
//radius of each nudge
nudgeRad=3.5;
//how deep into the body
nudgeDeep=1.5;
//Offset for the first nudge
nudgeOffset=12.5; 

/* [Hidden] */
fudge=0.1;
cavPitch=[11.8,11];
cavOffset=[8,2.5,0];
insOffset=[43.3,2.5,1];
txt1Offset=[7,42.1,3.5];
txt2Offset=[7,34.1,3.5];
txt3Offset=[7,26,3.5];
txt1Size=7.3;
txt2Size=5.8;
txt3Size=5.8;
$fn=50;


sample();
translate([-insrtDims.z-3,0,0])  insert();

//the insert
module insert(){
  featuresPitch=insrtDims.x/8;
  difference(){
    linear_extrude(insrtDims.y) difference(){
      square([insrtDims.z,insrtDims.x]);
      translate([insrtDims.z,featuresPitch]) square(insrtDims.z,true);
      translate([insrtDims.z,featuresPitch*2]) circle(insrtDims.z/2);
    }
    translate([insrtDims.z,featuresPitch*3,insrtDims.y/4]) sphere(insrtDims.z/2);
    translate([insrtDims.z,featuresPitch*3,insrtDims.y/2]) sphere(insrtDims.z/2);
  }

}
//the sample
module sample(){
    difference(){
      //body
      rndRect(ovDims,crnRad,0);
      //cavities
      for (ix=[0:2],iy=[0,1]){
        zOffset=ovDims.z-cavZ[iy][ix];
        translate([ix*cavPitch.x,iy*cavPitch.y,zOffset]+cavOffset) linear_extrude(cavZ[iy][ix]+fudge) cavity([cavSize,cavSize],cavRad);
      }
      //insert
      translate(insOffset) cube(insrtDims+insrtSpcng*2+[0,0,fudge]);
      //text line 1 (Manufacturer)
      translate(txt1Offset) linear_extrude(ovDims.z+fudge,convexity=5) text(text=txtLine1,size=txt1Size,font=str(txtFont,":style=",txtStyle));
      //text line 2 (Name)
      translate(txt2Offset) linear_extrude(ovDims.z+fudge,convexity=5) text(text=txtLine2,size=txt2Size,font=str(txtFont,":style=",txtStyle));
      //text line 3 (Material)
      translate(txt3Offset) linear_extrude(ovDims.z+fudge,convexity=5) text(text=txtLine3,size=txt3Size,font=str(txtFont,":style=",txtStyle));
      //nudge
      for (ix=[0:nudgeCnt-1])
        translate([nudgeOffset+ix*nudgeRad*2,ovDims.y+nudgeRad-nudgeDeep,-fudge/2]) cylinder(r=nudgeRad,h=ovDims.z+fudge);
      //hole
      if (drillHole) translate([ovDims.x-crnRad,ovDims.y-crnRad,-fudge/2]) cylinder(d=crnRad,h=ovDims.z+fudge);
    }
}

*cavity();
module cavity(size=[8,8],rad=2){
    square([size.x-rad,size.y-rad]);
    translate([rad,rad]) square([size.x-rad,size.y-rad]);
    translate([rad,size.y-rad]) circle(rad);
    translate([size.x-rad,rad]) circle(rad);
}
module rndRect(size=[10,10,2],radius=3,drillDia=1,center=false){
  //set to cube if size.y not defined
  dims = (size.y==undef) ? [size.x,size.x,size.x] : size;
  comp = (size.x>size.y) ? size.y : size.x; //which value to compare to
  radius = (radius>(comp/2)) ?  comp/2 : radius; //set and limit radius
  cntrOffset = center ? len(size)<3 ? [0,0] : // center && len(size)<3
                                      [0,0,-size.z/2] : //else if center
                                      [size.x/2,size.y/2,0]; //else
  echo(cntrOffset);
  if (len(size)<3)
    translate(cntrOffset) shape();
  else
    translate(cntrOffset) linear_extrude(size.z)  shape();

  module shape(){
    difference(){
      hull() for (ix=[-1,1], iy=[-1,1])
        translate([ix*(dims.x/2-radius),iy*(dims.y/2-radius)])
          circle(r=radius);//cube

      if (drillDia) for (ix=[-1,1],iy=[-1,1]) //drill holes
          translate([ix*(dims.x/2-radius),iy*(dims.y/2-radius)]) 
            circle(d=drillDia);
    }
  }
}
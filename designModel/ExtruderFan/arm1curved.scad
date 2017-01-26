//-- arm1curved.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Brazo.stl with slightly stronger part
//-- and with source file.
//-- GPL V3

arm_th=3;
len1=9;
len2=20+2;
arm_wi=7;
$fn=32;

//-- this arm variant is curved 90 degrees - useful in some cases

module arm() {
  difference() {
    // arm
    union() {
      // arm straight blocks
      translate([len1/2,0,arm_th/2]) cube([len1,arm_wi,arm_th], center=true);
      translate([len1,len2/2,arm_th/2]) cube([arm_wi,len2,arm_th], center=true);
      // this is the small reinforcement in the middle
      translate([len1-2,0,1.5*arm_th]) cube([len1-5,arm_th,arm_th], center=true);
      translate([len1,len2/2-3,1.5*arm_th]) cube([arm_th,len2-5,arm_th], center=true);
      // the two rounded ends and the rounded corner
      translate([0,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
      translate([len1,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
      translate([len1,len2,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
      // reinforcement rounded corner
      translate([len1,0,1.5*arm_th]) cylinder(r=arm_th/2, h=arm_th, center=true);
    }
    // holes
    cylinder(r=3.4/2, h=3*arm_th, center=true);
    translate([9,len2,0]) cylinder(r=3.4/2, h=3*arm_th, center=true);
  }
}

// build two mirrored copies
arm();
translate([-10,0,0]) mirror([1,0,0]) arm();
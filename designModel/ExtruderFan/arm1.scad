//-- arm1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Brazo.stl with slightly stronger part
//-- and with source file.
//-- GPL V3

arm_th=3;
arm_len=20;
arm_wi=7;
$fn=32;

//-- above are exactly same dimensions as original

difference() {
  // arm
  union() {
    translate([arm_len/2,0,arm_th/2]) cube([arm_len,arm_wi,arm_th], center=true);
    translate([arm_len/2,0,1.5*arm_th]) cube([12,arm_th,arm_th], center=true);
    translate([0,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
    translate([arm_len,0,arm_th/2]) cylinder(r=arm_wi/2, h=arm_th, center=true);
  }
  // holes
  cylinder(r=3.4/2, h=3*arm_th, center=true);
  translate([arm_len,0,0]) cylinder(r=3.4/2, h=3*arm_th, center=true);
}
//-- pivot_joint1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Soporte.stl with slightly stronger,
//-- better fitting part with pivot point,
//-- and most importantly,
//-- with this OpenSCAD source file.
//-- GPL V3

joint_len=4;
$fn=32;

module half_joint() {
  translate([joint_len/2,0,6/2]) cube([4,5,6], center=true);
  difference() {
    translate([joint_len/2+5.5,0,6/2]) cylinder(r=4.5,h=6, center=true);
    // M3 hole
    translate([joint_len/2+5.5,0,6/2]) cylinder(r=3.4/2,h=30, center=true);
  }
}

// a pivot joint
module pivot_joint() {
  half_joint();
  rotate([0,0,180]) half_joint();
  %translate([0,0,6/2]) cube([joint_len,5,6], center=true);
}

// build this part
pivot_joint();


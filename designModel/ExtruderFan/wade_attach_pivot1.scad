//-- wade_attach_pivot1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Soporte.stl with slightly stronger,
//-- better fitting part with pivot point,
//-- and most importantly,
//-- with this OpenSCAD source file.
//-- GPL V3

//-- requires matching pivot_hinge1 part
//-- or for an additional degree of freedom
//-- use part pivot_joint1

wade_r=12.5/2;
wade_dist=12;
plate_wi=20;
mini_r=0.1;

arm_th=3;
arm_len=20;
arm_wi=7;
$fn=32;

module attach_plate() {
  // a rectangular piece with an M4 hole in the middle and an extrusion to
  // fit in the M4 nut trap in the base of the Wade extruder
  translate ([0,0,arm_th/2]) {
    difference() {
      union() {
	translate([2,0,0]) cube([14,plate_wi, arm_th], center=true);
	translate([3,0,arm_th*0.75]) cylinder(r=7.6/2, h=arm_th*0.5, center=true, $fn=6);
      }
      translate([3,0,0]) cylinder(r=4.4/2, h=3*arm_th, center=true);
    }

    // curved surface to match the rounded edge of the Wade extruder
    difference() {
      translate([9,0,18.5/2-arm_th/2]) rotate([90,0,0]) cylinder(r=18.5/2, h=plate_wi, center=true);
      translate([9,0,12.5/2+arm_th/2]) rotate([90,0,0]) cylinder(r=12.5/2, h=2*plate_wi, center=true);
      cube([18,2*plate_wi,40], center=true); // cut tube in half
      translate([10,0,9+12.5/2+arm_th/2]) cube([18,2*plate_wi,18], center=true); // provide fit to curved wade surface
    }

    // avoid bridges: support the curved surface for printing
    // (this creates a hull around three mini rods)
    hull() {
      translate([9,0,mini_r-arm_th/2]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
      translate([arm_th+9+wade_r-mini_r,0,mini_r-arm_th/2]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
      translate([arm_th+9+wade_r-mini_r,0,18.5/2-arm_th/2-mini_r]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
    }
  }
}

// a pivot point
module pivot() {
  translate([19.5,0,6/2]) cube([4,5,6], center=true);
  difference() {
    translate([25,0,6/2]) cylinder(r=4.5,h=6, center=true);
    // M3 hole
    translate([25,0,6/2]) cylinder(r=3.4/2,h=30, center=true);
  }
}

// build this part
attach_plate();
pivot();


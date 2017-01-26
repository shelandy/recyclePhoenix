//-- wade_attach1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- replaces Soporte.stl with slightly stronger,
//-- better fitting part and most importantly,
//-- with this OpenSCAD source file.
//-- GPL V3

wade_r=12.5/2;
wade_dist=12;
plate_wi=20;

arm_th=3;
arm_len=20;
arm_wi=7;
$fn=32;

// a rectangular piece with an M4 hole in the middle and an extrusion to
// fit in the M4 nut trap in the base of the Wade extruder
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
mini_r=0.1;
hull() {
  translate([9,0,mini_r-arm_th/2]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
  translate([arm_th+9+wade_r-mini_r,0,mini_r-arm_th/2]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
  translate([arm_th+9+wade_r-mini_r,0,18.5/2-arm_th/2-mini_r]) rotate([90,0,0]) cylinder(r=mini_r, h=plate_wi, center=true);
}

// the hinge - basically three times the same shape
// and again hull() comes in handy to join everything together
difference() {
  union() {
    hull() {
      translate([18,-3-3.2,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
      translate([25,-3-3.2,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
      translate([29,-3-3.2,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
    }
    hull() {
      translate([18,0,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
      translate([25,0,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
      translate([29,0,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
    }
    hull() {
      translate([18,3+3.2,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
      translate([25,3+3.2,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
      translate([29,3+3.2,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
    }
  }
  // M3 hole
  translate([25,0,5]) rotate ([90,0,0]) cylinder(r=3.4/2,h=30, center=true);
}

//-- pivot_hinge1.scad by AndrewBCN - November 2014
//-- remix of thing #154834
//-- matches wade_attach_pivot1.scad
//-- GPL V3

wade_r=12.5/2;
wade_dist=12;
plate_wi=20;

arm_th=3;
arm_len=20;
arm_wi=7;
$fn=32;


module hinge() {
  // the hinge - basically three times the same shape
  // and again hull() comes in handy to join everything together
  difference() {
    union() {
      hull() {
	translate([12,-3-3.2,4]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([16,-3-3.2,0.1/2]) cube([1,3,0.1],center=true);
      }
      hull() {
	translate([12,0,4]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([16,0,0.1/2]) cube([1,3,0.1],center=true);
      }
      hull() {
	translate([12,3+3.2,4]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([16,3+3.2,0.1/2]) cube([1,3,0.1],center=true);
      }
    }
    // M3 hole
    translate([12,0,4]) rotate ([90,0,0]) cylinder(r=3.4/2,h=30, center=true);
  }
  translate([17,0,3]) cube([3,15.4,6],center=true);
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
hinge();
pivot();


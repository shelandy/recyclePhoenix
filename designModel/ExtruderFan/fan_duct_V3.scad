//-- A custom fan duct for my P3Steel + E3D setup
//-- AndrewBCN - Barcelona, November 2014

// build a square base for the fan, 40mm, 4mm thick
// with rounded corners, and make a circular hole in it

// our rounding cylinders have r=1

// V1: trying to reproduce the shape of the fan duct in
// Thingiverse #154834

// V2: shorter version

// V3: slightly shorter and larger beak

$fn=32;

fan_size = 40;
corner_r = 1;
base_thickness = 4;
hole_pitch = 32;
hole_diam = 3.1;
hole_r = hole_diam/2;
nut_diam = 6.9;
wall_th = 1.2;
arm_th=8.5;

module funnel() {
  // there are many ways to make a funnel of any shape, basically
  // this is just one method
  difference() {
    union() {
    
      // The funnel, part 1

      color("green") {
	difference() {
	  // funnel outer shell
	  hull() {
	    translate([0,0,base_thickness+1]) cylinder(r=37/2+wall_th, h=0.1, center=true, $fn=64);
	    translate([0,0,base_thickness+1+5]) scale([1,0.97,1]) rotate ([2,0,0]) cylinder(r=37/2.2+wall_th, h=0.1, center=true, $fn=64);
	  }
	  // funnel inner shell
	  hull() {
	    translate([0,0,base_thickness+1]) cylinder(r=37/2, h=0.1, center=true, $fn=64);
	    translate([0,0,base_thickness+1+5]) scale([1,0.97,1]) rotate ([2,0,0]) cylinder(r=37/2.2, h=0.1, center=true, $fn=64);
	  }
	}
      }
      
      // The funnel, part 2

      color("purple") {
	difference() { 
	  // funnel outer shell
	  hull() {
	    translate([0,0,base_thickness+1+5]) scale([1,0.97,1]) rotate ([2,0,0]) cylinder(r=37/2.2+wall_th, h=0.1, center=true, $fn=64);
	    translate([0,0,base_thickness+1+9]) scale([1,0.93,1]) rotate ([4,0,0]) cylinder(r=37/2.4+wall_th, h=0.1, center=true, $fn=64);
	  }
	  // funnel inner shell
	  hull() {
	    translate([0,0,base_thickness+1+5]) scale([1,0.97,1]) rotate ([2,0,0]) cylinder(r=37/2.2, h=0.1, center=true, $fn=64);
	    translate([0,0,base_thickness+1+9]) scale([1,0.93,1]) rotate ([4,0,0]) cylinder(r=37/2.4, h=0.1, center=true, $fn=64);
	  }
	}
      }
      
      // The funnel, part 3

      color("red") {
	difference() { 
	  // funnel outer shell
	  hull() {
	    translate([0,0,base_thickness+1+9]) scale([1,0.93,1]) rotate ([4,0,0]) cylinder(r=37/2.4+wall_th, h=0.1, center=true, $fn=64);
	    translate([0,-1,base_thickness+1+23]) scale([0.8,0.50,1]) rotate ([5,0,0]) cylinder(r=37/2.4+wall_th, h=0.1, center=true, $fn=64);
	  }
	  // funnel inner shell
	  hull() {
	    translate([0,0,base_thickness+1+9]) scale([1,0.93,1]) rotate ([4,0,0]) cylinder(r=37/2.4, h=0.1, center=true, $fn=64);
	    translate([0,-1,base_thickness+1+23]) scale([0.8,0.50,1]) rotate ([5,0,0]) cylinder(r=37/2.4, h=0.1, center=true, $fn=64);
	  }
	}
      }
      
      // The funnel, part 4

      color("orange") {
	difference() { 
	  // funnel outer shell
	  hull() {
	    translate([0,-1,base_thickness+1+23]) scale([0.8,0.50,1]) rotate ([5,0,0]) cylinder(r=37/2.4+wall_th, h=0.1, center=true, $fn=64);
	    translate([0,-8,base_thickness+1+44]) rotate([-30,0,0]) cube([37/2.1+wall_th, 2.9+wall_th, 0.1], center=true);
	  }
	  // funnel inner shell
	  hull() {
	    translate([0,-1,base_thickness+1+23]) scale([0.8,0.50,1]) rotate ([5,0,0]) cylinder(r=37/2.4, h=0.1, center=true, $fn=64);
	    translate([0,-8,base_thickness+1+44]) rotate([-30,0,0]) cube([37/2.1, 2.9, 0.1], center=true);
	  }
	}
	// divide the airflow
	//translate([0,20,base_thickness+1+46]) scale([1,1,5]) rotate ([70,0,0]) cylinder(r=0.5, h=3.2, center=true, $fn=64);
      }
    }
    // and the beak (may not be needed)
    //%translate([0,14,base_thickness+50]) rotate([35,0,0]) cube([30,3,15], center=true);
  }
}

module hinge() {
  // the hinge - basically three times the same shape
  // and again hull() comes in handy to join everything together
  difference() {
    union() {
      hull() {
	translate([18,-3-3.2,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
	translate([25,-3-3.2,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([25,-3-3.2,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
      }
      hull() {
	translate([18,0,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
	translate([25,0,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([25,0,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
      }
      hull() {
	translate([18,3+3.2,9.1/2-arm_th/2]) cube([1,3,9.1],center=true);
	translate([25,3+3.2,5]) rotate ([90,0,0]) cylinder(r=4,h=3, center=true);
	translate([25,3+3.2,0.1/2-arm_th/2]) cube([1,3,0.1],center=true);
      }
    }
    // M3 hole
    translate([25,0,5]) rotate ([90,0,0]) cylinder(r=3.4/2,h=30, center=true);
    //remove anything below base
    translate([0,0,-20]) cube([80,80,40], center=true);
  }
}

module base() {
  // the base - should fit exactly to a 40mm fan with 32mm hole spacing
  // build a square base for the fan, 4mm thick with rounded
  // corners, and make a round hole in it that matches the fan
  
  // Define some points beforehand
  P1=[fan_size/2-corner_r,fan_size/2-corner_r,base_thickness/2];
  P2=[-fan_size/2+corner_r,fan_size/2-corner_r,base_thickness/2];
  P3=[fan_size/2-corner_r,-fan_size/2+corner_r,base_thickness/2];
  P4=[-fan_size/2+corner_r,-fan_size/2+corner_r,base_thickness/2];

  P5=[hole_pitch/2,hole_pitch/2,base_thickness/2];
  P6=[-hole_pitch/2,hole_pitch/2,base_thickness/2];
  P7=[hole_pitch/2,-hole_pitch/2,base_thickness/2];
  P8=[-hole_pitch/2,-hole_pitch/2,base_thickness/2];

  P9=[hole_pitch/2,hole_pitch/2,base_thickness];
  P10=[-hole_pitch/2,hole_pitch/2,base_thickness];
  P11=[hole_pitch/2,-hole_pitch/2,base_thickness];
  P12=[-hole_pitch/2,-hole_pitch/2,base_thickness];

  difference() {
    union() {
      rotate([0,0,-90]) hinge();
      hull() {
	translate(P1) cylinder(r=corner_r, h=base_thickness, center=true);
	translate(P2) cylinder(r=corner_r, h=base_thickness, center=true);
	translate(P3) cylinder(r=corner_r, h=base_thickness, center=true);
	translate(P4) cylinder(r=corner_r, h=base_thickness, center=true);
      }
    translate([0,0,base_thickness]) cylinder(r=37/2+wall_th,h=1, $fn=64);
    }
    translate(P5) cylinder(r=hole_r, h=base_thickness+0.5, center=true);
    translate(P6) cylinder(r=hole_r, h=base_thickness+0.5, center=true);
    translate(P7) cylinder(r=hole_r, h=base_thickness+0.5, center=true);
    translate(P8) cylinder(r=hole_r, h=base_thickness+0.5, center=true);
    
    translate(P9) cylinder(r=nut_diam/2, h=base_thickness, center=true, $fn=6);
    translate(P10) cylinder(r=nut_diam/2, h=base_thickness, center=true, $fn=6);
    translate(P11) cylinder(r=nut_diam/2, h=base_thickness, center=true, $fn=6);
    translate(P12) cylinder(r=nut_diam/2, h=base_thickness, center=true, $fn=6);
    
    cylinder(r=37/2, h=11, center=true, $fn=64);
  }
}

base();
funnel();
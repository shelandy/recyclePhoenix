Ht = 8;
M5=5.5;
M5Head=9;
$fn=48;
m18=Ht-2;           //for M5x18mm socket head screws
m16=Ht-4;           //for M5x16mm socket head screws
module Plate()
{
    union()
    {
        translate([0,-7.75,0])
        cylinder(d=30,h=Ht-2);
        translate([0,-7.75,Ht-2.01])
        cylinder(d1=30,d2=26,h=2);
        translate([0,7.75,0])
        cylinder(d=30,h=Ht-2);
        translate([0,7.75,Ht-2.01])
        cylinder(d1=30,d2=26,h=2);
        translate([-15,-7.75,0])
        cube([30,15.5,Ht-2]);
        translate([0,1.538,Ht-2.01])
        rotate([0,0,22.5])
        cylinder(d1=32.4708,d2=28.1422,h=2,$fn=8);
        translate([0,-1.538,Ht-2.01])
        rotate([0,0,22.5])
        cylinder(d1=32.4708,d2=28.1422,h=2,$fn=8);
//Add Ridges to top to make it more rigid
        translate([-7.75,-14,Ht])
        rotate([-90,0,0])
        Ridge();
        translate([7.75,-14,Ht])
        rotate([-90,0,0])
        Ridge();
    }
}
module Ridge()
{
    union()
    {
        cylinder(d=4,h=28,$fn=12);
        translate([0,0,28])
        cylinder(d1=4,d2=0,h=4,$fn=12);
        translate([0,0,-4])
        cylinder(d1=0,d2=4,h=4,$fn=12);
    }
}
module DrawPlate()
{
    difference()
    {
        Plate();
        translate([0,-7.75,-1])
        cylinder(d=M5,h=Ht+2,$fn=32);
        translate([0,7.75,-1])
        cylinder(d=M5,h=Ht+2,$fn=32);
//Uncomment next 4 lines to useuse M5x16mm instead of M5x18mm socket heads
//        translate([0,-7.75,m18])
//        cylinder(d=M5Head,h=Ht+2,$fn=32);
//        translate([0,7.75,m18])
//        cylinder(d=M5Head,h=Ht+2,$fn=32);
//Cut a notch at bottom so I can pry it off the buildtak easier
        translate([0,-(22.75+8.6),-.01])
        rotate([0,0,45])
        cylinder(d1=30,d2=0,h=4,$fn=4);
        translate([0,(22.75+8.6),-.01])
        rotate([0,0,45])
        cylinder(d1=30,d2=0,h=4,$fn=4);
    }
}

DrawPlate();
//Uncomment next 2 lines to draw two plates
//translate([34,0,0])
//DrawPlate();
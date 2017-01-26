//Belt Clamp to secure y-axis belt to bottom of Plastic Y-Carriage Plates
//I used the belt clamping idea from:
//http://www.thingiverse.com/thing:643799 to create this
Ht = 6.36;
Bht=6;
M3=3.5;
M5=5.5;
M5Head=9;           //Diameter to cut for M5 bolt head
$fn=24;
module Base()
{
    linear_extrude(height = Bht, center = false, convexity = 10)polygon(points = 
    [[-9.59,-2.74],[9.59,-2.74],[10.1,-2.67],
    [10.58,-2.48],[10.99,-2.16],[11.31,-1.75],
    [13.64,2.24],[13.7,2.36],[13.78,2.75],
    [13.78,7.48],[13.62,8.25],[13.19,8.89],
    [9.55,14.37],[9.21,15.38],[9.21,18.98],
    [-9.21,18.98],[-9.21,15.38],[-9.55,14.37],
    [-13.19,8.89],[-13.62,8.25],[-13.78,7.48],
    [-13.78,2.75],[-13.7,2.36],[-13.64,2.24],
    [-11.31,-1.75],[-10.99,-2.16],[-10.58,-2.48],
    [-10.1,-2.67]]);
}
module DrawFillets()
{
//Fillet on top of base that connects to Vertical Base
    translate([-9.3,17.5,Bht])
    rotate([0,90,0])
    cylinder(d=2,h=18.6,$fn=4);
//Fillet on left of base that connects to Vertical Base
    translate([-9.3,17.5,0])
    rotate([0,0,0])
    cylinder(d=2,h=Bht,$fn=4);
    translate([-9.3,17.5,Bht])
    rotate([0,0,0])
    cylinder(d1=2,d2=0,h=1,$fn=4);
//Fillet on Right of base that connects to Vertical Base
    translate([9.3,17.5,0])
    rotate([0,0,0])
    cylinder(d=2,h=Bht,$fn=4);
    translate([9.3,17.5,Bht])
    rotate([0,0,0])
    cylinder(d1=2,d2=0,h=1,$fn=4);
//Fillet top Clamp area
    translate([-11.78,9.48,Bht])
    rotate([0,90,0])
    cylinder(d=2,h=23.55,$fn=4);
}
module BaseVert()
{
    linear_extrude(height = Bht, center = false, convexity = 10)polygon(points = 
    [[16.25,0],[17.42,0.12],[18.55,0.46],
    [19.58,1.01],[20.49,1.76],[23.24,4.51],
    [23.99,5.42],[24.54,6.45],[24.88,7.58],
    [25,8.75],[24.88,9.92],[24.54,11.05],
    [23.99,12.08],[23.24,12.99],[20.49,15.74],
    [19.58,16.49],[18.55,17.04],[17.42,17.38],
    [16.25,17.5],[-16.25,17.5],[-17.42,17.38],
    [-18.55,17.04],[-19.58,16.49],[-20.49,15.74],
    [-23.24,12.99],[-23.99,12.08],[-24.54,11.05],
    [-24.88,9.92],[-25,8.75],[-24.88,7.58],
    [-24.54,6.45],[-23.99,5.42],[-23.24,4.51],
    [-20.49,1.76],[-19.58,1.01],[-18.55,0.46],
    [-17.42,0.12],[-16.25,0]]);
}

module Middle()
{
    translate([0,0,Bht-.01])
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[-11.78,5.48],[-7.48,5.48],[-6.41,5.37],
    [-5.38,5.06],[-4.44,4.56],[-3.61,3.87],
    [-2.92,3.04],[-2.42,2.1],[-2.11,1.07],
    [-2,0],[-2,-2.24],[-1.5,-2.74],
    [1.5,-2.74],[2,-2.24],[2,0],
    [2.11,1.07],[2.42,2.1],[2.92,3.04],
    [3.61,3.87],[4.44,4.56],[5.38,5.06],
    [6.41,5.37],[7.48,5.48],[11.78,5.48],
    [12.54,5.63],[13.19,6.07],[13.62,6.71],
    [13.78,7.48],[13.62,8.25],[13.19,8.89],
    [12.54,9.33],[11.78,9.48],[-11.78,9.48],
    [-12.54,9.33],[-13.19,8.89],[-13.62,8.25],
    [-13.78,7.48],[-13.62,6.71],[-13.19,6.07],
    [-12.54,5.63]]);
}
module Left()
{
    translate([0,0,Bht-.01])
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[-4.5,0],[-4.6,0.77],[-4.9,1.49],
    [-5.37,2.11],[-5.99,2.58],[-6.71,2.88],
    [-8.36,3.61],[-9.17,3.78],[-12.75,3.78],
    [-13.14,3.7],[-13.48,3.48],[-13.7,3.15],
    [-13.78,2.75],[-13.7,2.36],[-13.64,2.24],
    [-11.31,-1.75],[-10.99,-2.16],[-10.58,-2.48],
    [-10.1,-2.67],[-9.59,-2.74],[-5,-2.74],
    [-4.5,-2.24]]);
}
module Right()
{
    translate([0,0,Bht-.01])
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[4.5,0],[4.6,0.77],[4.9,1.49],
    [5.37,2.11],[5.99,2.58],[6.71,2.88],
    [8.36,3.61],[9.17,3.78],[12.75,3.78],
    [13.14,3.7],[13.48,3.48],[13.7,3.15],
    [13.78,2.75],[13.7,2.36],[13.64,2.24],
    [11.31,-1.75],[10.99,-2.16],[10.58,-2.48],
    [10.1,-2.67],[9.59,-2.74],[5,-2.74],
    [4.5,-2.24]]);
}
module HolesVert()
{
    translate([-8.6,.28,-1])
    cylinder(d=M3,h=20);
    translate([8.6,.28,-1])
    cylinder(d=M3,h=20);
//Uncomment next 2 lines to add another hole in center of middle, not needed
//    translate([0,5.73,-1])
//    cylinder(d=M3,h=20);
}

module HolesHor()
{
    translate([-19,0,8.75])
    rotate([-90,0,0])
    cylinder(d=M5,h=30);
    translate([19,0,8.75])
    rotate([-90,0,0])
    cylinder(d=M5,h=30);
//Uncomment 6 lines below to Countersink for 16mm length bolts
//You may have to do a little cleanup on the countersink
//    translate([-19,16.5,8.75])
//    rotate([-90,0,0])
//    cylinder(d=M5Head,h=3.5);
//    translate([-19,16.5,8.75])
//    rotate([-90,0,0])
//    cylinder(d=M5Head,h=3.5);
}
module DrawUnion()
{
    union()
    {
        Base();
        Right();
        Left();
        Middle();
        translate([0,6+17.5,0])
        rotate([90,0,0])
        BaseVert();
        DrawFillets();
    }
}
module DrawFinal()
{
difference()
{
    DrawUnion();
//Punch M3 holes for securing Belt
    HolesVert();
//Punch M5 holes for mounting to Y-Bed
    HolesHor();
}
}
DrawFinal();
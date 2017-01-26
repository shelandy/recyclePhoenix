//X-Motor Mount for Makerfarm i3v 10"
//Revised to cut out 2 eccentric holes & less plastic
//By David Bunch 5/28/2015
//1.56oz at .6 infill of PTEG
//Time to print: 02:23:47
Ht = 6;
M3=3.6;
M5=5.5;
M7=7.5;
$fn=32;
ires_Big=64;
EarHt=.5;       //Height of Ears to draw
EarsOn=1;       //Draw Ears, 1 = Yes, 0 = No
Supports=1;     //Print Support System, 1 = Yes, 0 = No
Assembly=1;     //Show assembly of part, 1 = Yes, 0 = No
//I used the motor from: http://www.thingiverse.com/thing:820960
//for this reference
module Nema17()
{
    translate([30.3833,44.639,Ht])
    color("red")
    import("Nema_17Motor_820960.stl", convexity=3);
}
module PrintSupports()
{
    translate([0,0,3.0])
    import("PrintSupports_Rev27.stl", convexity=3);
}
module Alum20x20()
{
    linear_extrude(height = 452, center = false, convexity = 10)polygon(points = 
    [[-10,-8.5],[-8.5,-10],[-4.64,-10],
    [-2.84,-8.2],[-5.5,-8.2],[-5.5,-6.56],
    [-2.84,-3.9],[2.84,-3.9],[5.5,-6.56],
    [5.5,-8.2],[2.84,-8.2],[4.64,-10],
    [8.5,-10],[10,-8.5],[10,-4.64],
    [8.2,-2.84],[8.2,-5.5],[6.56,-5.5],
    [3.9,-2.84],[3.9,2.84],[6.56,5.5],
    [8.2,5.5],[8.2,2.84],[10,4.64],
    [10,8.5],[8.5,10],[4.64,10],
    [2.84,8.2],[5.5,8.2],[5.5,6.56],
    [2.84,3.9],[-2.84,3.9],[-5.5,6.56],
    [-5.5,8.2],[-2.84,8.2],[-4.64,10],
    [-8.5,10],[-10,8.5],[-10,4.64],
    [-8.2,2.84],[-8.2,5.5],[-6.56,5.5],
    [-3.9,2.84],[-3.9,-2.84],[-6.56,-5.5],
    [-8.2,-5.5],[-8.2,-2.84],[-10,-4.64]]);
}
module Tnut()
{
    color("red")
    difference()
    {
    linear_extrude(height = 1.8, center = false, convexity = 10)polygon(points = 
    [[-7.5,-4],[-2.5,-5],[2.5,-5],
    [7.5,-4],[7.5,4],[2.5,5],
    [-2.5,5],[-7.5,4],[-7.5,-4]]);
        translate([0,0,-1])
        cylinder(d=5.5,h=3.8);
    }
}
if (Assembly == 1)
{
    translate([66.91,64.64,Ht])
    %Tnut();
    translate([66.91,24.64,Ht])
    %Tnut();
    %Nema17();
    translate([5.8,0,0])
    %Nema17();
    translate([80.906,-45,-12])
    rotate([-90,0,0])
    %Alum20x20();
    translate([58.68,24.64,6+10])
    rotate([0,90,0])
    %Alum20x20();
    translate([58.68,64.64,6+10])
    rotate([0,90,0])
    %Alum20x20();
}
module DrawEars()
{
    difference()
    {
        translate([1,12.8,0])
        cylinder(d=25,h=EarHt);
        MotorCut();
    }
    difference()
    {
        translate([1,76.5,0])
        cylinder(d=25,h=EarHt);
        MotorCut();
    }
    translate([102,9.78,0])
    cylinder(d=25,h=EarHt);
    translate([102,79.5,0])
    cylinder(d=25,h=EarHt);
}
//This draws the the ledge around the top perimeter
module Ledge()
{
    difference()
    {
        translate([0,0,Ht])
        color("green")
        scale([1,1,1.5])
        import("X-MotorMountLedgePath_rev27.stl", convexity=3);
        translate([92.95,12.55,3])
        rotate([0,0,45])
        rotate([0,-45,0])
        translate([0,-10,-10])
        cube([50,20,20]);
        translate([92.95,76.64,3])
        rotate([0,0,-45])
        rotate([0,-45,0])
        translate([0,-10,-10])
        cube([50,20,20]);
    }
}
//This is the weld that runs along the Z-axis on the left side
//of the motor mount between the 2 2020 aluminum extrusions
module MidVertWeld()
{
    translate([58.88,53.64,Ht])
    rotate([90,0,0])
    linear_extrude(height = 18, center = false, convexity = 10)polygon(points = 
    [[0,0],[6,0],[0,6]]);
}
//This is the ledge that runs along the X-axis
//between the 2020 aluminum extrusions
module MidLedge()
{
    color("green")
    difference()
    {
        translate([58.88,44.64,Ht])
        rotate([0,90,0])
        scale([1.6,1,1])
        rotate([0,0,22.5])
        cylinder(d=8.65,h=35,$fn=8);        //Main Weld
        translate([93.88,35,Ht])
        rotate([0,-45,0])
        cube([10,20,10]);           //Chamfer off Left side
        translate([0,0,12])
        cube([160,55,10]);          //Slice off to top to be flush
        translate([0,0,-10])
        cube([160,55,10]);          //Slice off the bottom
    }
}
//This the main base plate
module X_Carriage()
{
    union()
    {
        linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[72.99,85.64],[72.01,85.69],[71.04,85.83],[70.08,86.07],
    [69.16,86.4],[68.27,86.82],[65.95,88.16],[65.07,88.61],
    [64.16,88.97],[63.22,89.24],[62.25,89.41],[61.27,89.49],
    [60.95,89.5],[60.29,89.48],[59.32,89.37],[58.36,89.16],
    [57.42,88.86],[56.52,88.47],[55.66,87.99],[54.86,87.43],
    [54.11,86.8],[45.87,78.57],[45.14,77.91],[44.36,77.32],
    [43.51,76.82],[42.63,76.4],[41.7,76.07],[40.75,75.83],
    [39.78,75.69],[38.8,75.64],[20.17,75.64],[19.19,75.69],
    [18.22,75.83],[17.26,76.07],[16.34,76.4],[15.45,76.82],
    [14.61,77.32],[13.82,77.91],[13.1,78.57],[12.37,79.23],
    [11.58,79.81],[10.74,80.32],[9.85,80.74],[8.93,81.07],
    [7.98,81.3],[7.01,81.45],[6.03,81.5],[5.05,81.45],
    [4.07,81.3],[3.12,81.07],[2.2,80.74],[1.31,80.32],
    [0.47,79.81],[-0.32,79.23],[-1.05,78.57],[-1.7,77.84],
    [-2.29,77.05],[-2.79,76.21],[-3.21,75.32],[-3.54,74.4],
    [-3.78,73.45],[-3.93,72.48],[-3.97,71.5],[-3.93,70.52],
    [-3.78,69.55],[-3.54,68.59],[-3.21,67.67],[-2.79,66.78],
    [-2.29,65.94],[-1.7,65.15],[-1.05,64.43],[-0.39,63.7],
    [0.2,62.91],[0.7,62.07],[1.12,61.18],[1.45,60.26],
    [1.69,59.31],[1.83,58.33],[1.88,57.35],[1.88,31.83],
    [1.83,30.85],[1.69,29.88],[1.45,28.93],[1.12,28.01],
    [0.7,27.12],[0.2,26.28],[-0.39,25.49],[-1.05,24.76],
    [-1.7,24.04],[-2.29,23.25],[-2.79,22.41],[-3.21,21.52],
    [-3.54,20.59],[-3.78,19.64],[-3.93,18.67],[-3.97,17.69],
    [-3.93,16.71],[-3.78,15.74],[-3.54,14.79],[-3.21,13.86],
    [-2.79,12.98],[-2.29,12.14],[-1.7,11.35],[-1.05,10.62],
    [-0.32,9.96],[0.47,9.38],[1.31,8.87],[2.2,8.45],
    [3.12,8.12],[4.07,7.88],[5.05,7.74],[6.03,7.69],
    [7.01,7.74],[7.98,7.88],[8.93,8.12],[9.85,8.45],
    [10.74,8.87],[11.58,9.38],[12.37,9.96],[13.1,10.62],
    [13.82,11.28],[14.61,11.86],[15.45,12.37],[16.34,12.79],
    [17.26,13.12],[18.22,13.36],[19.19,13.5],[20.17,13.55],
    [38.8,13.55],[39.78,13.5],[40.75,13.36],[41.7,13.12],
    [42.63,12.79],[43.51,12.37],[44.36,11.86],[45.14,11.28],
    [45.87,10.62],[54.11,2.39],[54.86,1.76],[55.66,1.2],
    [56.52,0.72],[57.42,0.33],[58.36,0.03],[59.32,-0.18],
    [60.29,-0.29],[60.95,-0.31],[61.27,-0.31],[62.25,-0.23],
    [63.22,-0.05],[64.16,0.22],[65.07,0.58],[65.95,1.03],
    [68.27,2.37],[69.16,2.79],[70.08,3.12],[71.04,3.35],
    [72.01,3.5],[72.99,3.55],[81.8,3.55],[82.59,3.57],
    [83.37,3.65],[84.14,3.78],[84.91,3.96],[85.66,4.18],
    [86.4,4.46],[87.11,4.78],[87.8,5.15],[88.47,5.57],
    [89.11,6.03],[89.72,6.52],[90.29,7.06],[102.63,19.4],
    [103.24,20.06],[103.8,20.76],[104.3,21.5],[104.75,22.28],
    [105.14,23.09],[105.47,23.92],[105.73,24.78],[105.93,25.65],
    [106.07,26.54],[106.13,27.44],[106.14,27.89],[106.19,31.43],
    [106.33,32.4],[106.57,33.36],[106.9,34.28],[107.32,35.17],
    [107.83,36.01],[108.41,36.8],[109.07,37.52],[109.73,38.25],
    [110.31,39.04],[110.82,39.88],[111.24,40.77],[111.57,41.69],
    [111.81,42.64],[111.95,43.61],[112,44.59],[111.95,45.57],
    [111.81,46.55],[111.57,47.5],[111.24,48.42],[110.82,49.31],
    [110.31,50.15],[109.73,50.94],[109.07,51.67],[108.41,52.39],
    [107.83,53.18],[107.32,54.02],[106.9,54.91],[106.57,55.83],
    [106.33,56.79],[106.19,57.76],[106.14,58.74],[106.14,61.3],
    [106.13,61.75],[106.07,62.65],[105.93,63.53],[105.73,64.41],
    [105.47,65.27],[105.14,66.1],[104.75,66.91],[104.3,67.69],
    [103.8,68.43],[103.24,69.13],[102.63,69.79],[90.29,82.13],
    [89.72,82.66],[89.11,83.16],[88.47,83.62],[87.8,84.03],
    [87.11,84.4],[86.4,84.73],[85.66,85.01],[84.91,85.23],
    [84.14,85.41],[83.37,85.54],[82.59,85.62],[81.8,85.64]]);
        Ledge();
    }
}
//This is the plate that the motor attaches to
module FrontPlate()
{
    translate([0,0,Ht])
    difference()
    {
        union()
        {
            color("cyan")
            linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
            [[50.59,70.14],[10.88,70.14],[9.91,70.04],
            [8.97,69.76],[8.11,69.3],[7.35,68.67],
            [6.73,67.92],[6.26,67.05],[5.98,66.11],
            [5.88,65.14],[5.88,24.14],[5.98,23.16],
            [6.26,22.23],[6.73,21.36],[7.35,20.6],
            [8.11,19.98],[8.97,19.52],[9.91,19.24],
            [10.88,19.14],[50.59,19.14],[51.28,19.19],
            [51.96,19.33],[52.62,19.57],[53.24,19.9],
            [53.8,20.31],[54.3,20.79],[54.73,21.34],
            [55.08,21.95],[57.82,27.58],[58.88,30.14],
            [58.88,59.14],[57.82,61.7],[55.08,67.33],
            [54.73,67.93],[54.3,68.48],[53.8,68.97],
            [53.24,69.38],[52.62,69.71],[51.96,69.95],
            [51.28,70.09],[50.59,70.14]]);
            translate([12.88,19.16,0])
            HorWeld();
            translate([50.59,70.14,0])
            rotate([0,0,180])
            HorWeld();
        }
        //Holes();
        HolesPlate();
        CornerHoles();
    }
}
//This is the weld between the motor mount top plate & the the outer ledge
module HorWeld()
{
    difference()
    {
        rotate([0,90,0])
        rotate([0,0,180])
        linear_extrude(height = 38, center = false, convexity = 10)polygon(points = 
        [[0,0],[3,0],[0,3]]);
        rotate([0,-45,0])
        translate([0,-5,0])
        cube([10,10,10]);
        translate([38,0,0])
        rotate([0,-45,0])
        translate([0,-5,0])
        cube([10,10,10]);
    }
}
module AlumMntHoles()
{
//Bottom Left
    translate([66.91,24.64,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Bottom Right
    translate([96.91,24.64,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Top Left
    translate([66.91,64.64,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Top Right
    translate([96.91,64.64,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
}
module MotorCut()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[9.88,22.64],[52.88,22.64],[57.82,27.58],
    [58.88,30.14],[58.88,59.14],[57.82,61.7],
    [52.88,66.64],[9.88,66.64],[7.88,64.64],
    [7.88,24.64]]);
}
module Arrow()
{
    translate([0,0,Ht-2])
    scale([.75,.75,1])
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[0,0],[7.5,0],[7.5,-2.46],
    [13.5,1],[7.5,4.46],[7.5,2],
    [0,2]]);
}
module MotorShaftCut()
{
    hull()
    {
        translate([22.13,44.64,-1])
        cylinder(d=19,h=Ht*2+2,$fn=ires_Big);
        translate([33.28,44.64,-1])
        cylinder(d=27.8,h=Ht*2+2,$fn=ires_Big);
        translate([44.43,44.64,-1])
        cylinder(d=19,h=Ht*2+2,$fn=ires_Big);
    }
}
module HolesPlate()
{
//Cut Slot hole for Motor shaft pass thru
    MotorShaftCut();
//Cut slots for Motor Mount Adjustments
//Lower Left Motor Mount
    translate([14.3833,28.639,-1])
    MotorAdjustMnt();
//Lower Right Motor Mount
    translate([46.3833,29.139,-1])
    MotorAdjustMnt();
//Upper Left Motor Mount
    translate([14.3833,,60.639,-1])
    MotorAdjustMnt();
//Upper Right Motor Mount
    translate([46.3833,60.639,-1])
    MotorAdjustMnt();
}
module MotorAdjustMnt()
{
    translate([0,0,0])
    cylinder(d=3.5,h=Ht+2);
    translate([5.8,0,0])
    cylinder(d=3.5,h=Ht+2);
    translate([0,-1.75,0])
    cube([5.8,3.5,Ht+2]);
}
module Holes()
{
//Lower Left Motor Mount Hole
    translate([17.8083,13.939,-1])
    cylinder(d=M3,h=Ht+2,$fn=16);
//Upper Left Motor Mount Hole
    translate([17.8083,73.339,-1])
    cylinder(d=M3,h=Ht+2,$fn=16);
//Lower Right Motor Mount Hole
    translate([49.0083,13.939,-1])
    cylinder(d=M3,h=Ht+2,$fn=16);
//Upper Right Motor Mount Hole
    translate([49.0083,73.339,-1])
    cylinder(d=M3,h=Ht+2,$fn=16);
}
module HolesWheels()
{
//Upper Left Wheel Mount Hole
    translate([60.906,79.5943,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Lower Left Wheel Mount Hole
    translate([60.906,9.5943,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Middle Right Wheel Mount Hole
    translate([100.906,44.5943,-1])
    cylinder(d=M5,h=Ht+2,$fn=24);
//Counter sink for eccentric middle Right Wheel
    translate([100.906,44.5943,-1])
    cylinder(d=M7,h=4.5,$fn=24);
    translate([100.906,44.5943,3.5])
    cylinder(d1=M7,d2=M5,h=1,$fn=24);
}
module CutLtTop()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[89.16,60.39],[89.02,61.8],[88.6,63.16],
    [87.93,64.42],[87.03,65.52],[85.93,66.42],
    [84.68,67.09],[83.32,67.5],[81.91,67.64],
    [80.49,67.5],[79.13,67.09],[77.88,66.42],
    [76.78,65.52],[75.88,64.42],[75.21,63.16],
    [74.8,61.8],[74.66,60.39],[74.66,56.89],
    [74.8,55.47],[75.21,54.11],[75.88,52.86],
    [76.78,51.76],[77.88,50.86],[79.13,50.19],
    [80.49,49.78],[81.91,49.64],[83.32,49.78],
    [84.68,50.19],[85.93,50.86],[87.03,51.76],
    [87.93,52.86],[88.6,54.11],[89.02,55.47],
    [89.16,56.89]]);
}
module CutLtBot()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[89.16,32.39],[89.02,33.8],[88.6,35.16],
    [87.93,36.42],[87.03,37.52],[85.93,38.42],
    [84.68,39.09],[83.32,39.5],[81.91,39.64],
    [80.49,39.5],[79.13,39.09],[77.88,38.42],
    [76.78,37.52],[75.88,36.42],[75.21,35.16],
    [74.8,33.8],[74.66,32.39],[74.66,19.3],
    [74.8,17.89],[75.21,16.53],[75.88,15.27],
    [76.78,14.17],[77.88,13.27],[79.13,12.6],
    [80.49,12.19],[81.91,12.05],[83.32,12.19],
    [84.68,12.6],[85.93,13.27],[87.03,14.17],
    [87.93,15.27],[88.6,16.53],[89.02,17.89],
    [89.16,19.3]]);
}
module CornerHoles()
{
//Add extra holes at 4 corners
    translate([6,17.8-1])
    cylinder(d=M5,h=14);
    translate([6,71.5,-1])
    cylinder(d=M5,h=14);
}
module DrawUnion()
{
    union()
    {
        difference()
        {
            X_Carriage();
            MotorShaftCut();
            //TestCube();
            MotorCut();
            //Holes();
            HolesWheels();
            AlumMntHoles();
//Cut rectangle hole for Z-Axis Nut Holder Plate
//You can use http://www.thingiverse.com/thing:795954
//instead of wood part assembly that connects here
            translate([78.16,74.64,-1])
            cube([5.5,6.5,Ht+2]);
            translate([67.5,11.3,0])
            Arrow();
            CutLtTop();
            CutLtBot();
            CornerHoles();
        }
        translate([0,0,-.001])
        FrontPlate();
    
        MidVertWeld();
        MidLedge();
        DrawInsideWeld();
    }
}
module DrawInsideWeld()
{
    translate([58.9,24.6,Ht])
    difference()
    {    
        rotate([-90,0,0])
        cylinder(d=2,h=40,$fn=4);
        translate([-1,-1,0])
        cube([6,42,6]);     //Cut off top so it does not extend thru
    }
}
if (Supports == 1)
{
PrintSupports();
}
module DrawFinal()
{
    union()
    {
        DrawUnion();
        if (EarsOn == 1)
        {
            DrawEars();
        }
    }
}
difference()
{
    DrawFinal();
    CornerHoles();
}
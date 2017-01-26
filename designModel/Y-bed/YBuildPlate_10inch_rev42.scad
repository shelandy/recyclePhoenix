//Draw i3v 10" Y-Bed to print in 2 parts or 1 part Aluminum profile
//I used 1/8" Brass Round Bar, but you could also use
// 1/8" aluminum Round bar from a place like:
//https://www.midweststeelsupply.com/store/6061aluminumroundbar
//By David Bunch 4/17/2015
Ht=6;
M5=5.5;
M7=7.5;
M3=3.5;
$fn=32;
BPmm=8;           //6 or 8 mm width bump
BumpSize=9/6;   // 6/6 = 3mm High bump, 8/6 = 4mm High Bump, 10/6 = 5mm
                //Width of bumps will still be 6mm
//Scale  Total Ht	additional Ht
//6/6	10.45		0
//8/6	11.2		0.75
//9/6	11.57		1.12
//10/6	11.95		1.5
WheelHoleLt=-114.19;        //For 1mm looser fit each way ,change to -115.19
WheelHoleRt=114.19;        //For 1mm looser fit each way ,change to 115.19
Side=1;     //Side = 0, 1, 2 or 3
            //(0 = Female Dovetail Side & 1 = Male, 2= Solid Frame, 3 = Test Print
            // 4 = Both Male & Female Dovetail sides)
DrawEars=1;     //1 = Draw Ears, 0 = No Ears
BrDia=3.7;      //1/8" Brass round is 3.2mm in diameter
BrCutHt=8.25;        //Set to 10 to Cut Slot to melt Brass rod in top
                    //Set to 7.75mm for bottom of bar to be flush with bed
                    //Set to 14 or higher to not Cut
SagDist=0;   //1mm to compensate for slight sag, brass bar will unsag this
//Male Part at .6 infill = 4.33 oz.
//Female Part at .6 infill = 4.21 oz.
EarHt=.5;
//Rotate Male part 45 degrees in Slic3r program
//Rotate Female part -135 degrees in Slic3r program
//infill angle set to 22 degrees
//I set with 0 brim & .5mm Skirt distance to make sure plastic is flowing
module BeltClamp()
{
    translate([-8.75,0,-22.5])
    rotate([90,0,90])
    import("Y-AxisBeltClamp_rev20_repaired.stl", convexity=3);
}
module BrassBarCut()
{
//Cut for Brass rod near Heat Bed Mounts 2-257mm length
    translate([-150,-95,BrCutHt])
    rotate([0,90,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=130,$fn=12);
    translate([10,-95,BrCutHt])
    rotate([0,90,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=130,$fn=12);
//Raise middle up by 1mm top compensate for slight bow
    translate([-10,-95,BrCutHt-SagDist])
    rotate([0,90,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=20,$fn=12);
//Cut for Brass rod near Center 2-190mm length
    translate([-150,-39,BrCutHt])
    rotate([0,90,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=300,$fn=12);
//Flex corners support 2-243mm length
    translate([-104.7,-125,BrCutHt-BrDia-.5])
    rotate([-90,0,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=80,$fn=12);
    translate([104.7,-125,BrCutHt-BrDia-.5])
    rotate([-90,0,0])
    color("SandyBrown")
    cylinder(d=BrDia,h=80,$fn=12);
}
module BrassBars()
{
//Cut for Brass rod near Heat Bed Mounts 253.5 to 257mm length
    translate([-127.5,-95,BrCutHt])
    rotate([0,90,0])
    color("Chocolate")
    cylinder(d=BrDia,h=255,$fn=12);
//Cut for Brass rod near Center 190mm length
    translate([-95,-39,BrCutHt])
    rotate([0,90,0])
    color("Chocolate")
    cylinder(d=BrDia,h=190,$fn=12);
//Flex corner support 75mm lengths
    translate([-104.7,-125,BrCutHt-BrDia-.5])
    rotate([-90,0,0])
    color("Chocolate")
    cylinder(d=BrDia,h=80,$fn=12);
    translate([104.7,-125,BrCutHt-BrDia-.5])
    rotate([-90,0,0])
    color("Chocolate")
    cylinder(d=BrDia,h=80,$fn=12);
}
module X_Support()
{
    rotate([180,0,0])
    import("X-AxisSupportPlate_rev4.stl", convexity=3);
}
module Y_BedFemaleBumpUp()
{
//Z elevation starts at -2.25
//Ht of bumpouts at scale of 1 in the Z is 4.5
    translate([0,0,2.2])
    scale([1,1,BumpSize])
    color("cyan")
    import("Y-Bed_i3v10_FemaleBumpUps_41.stl", convexity=3);
}
module Y_BedMaleBumpUp()
{
//Z elevation starts at -2.25
    translate([0,0,2.2])
    scale([1,1,BumpSize])
    color("cyan")
    import("Y-Bed_i3v10_MaleBumpUps_41.stl", convexity=3);
}
module Alum20x20()
{
    translate([0,-151.7625,-12])
    rotate([-90,0,0])
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

translate([-45,0,0])
color("blue")
%X_Support();
translate([45,0,0])
color("blue")
%X_Support();
translate([-94.69,0,0])
%Alum20x20();
translate([94.69,0,0])
%Alum20x20();
color("red")
%BeltClamp();
module Female()
{
    union()
    {
        linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[-117.05,123.34],[-120.76,127.84],[-121.26,128.27],
    [-121.8,128.63],[-122.39,128.92],[-123.01,129.13],
    [-123.65,129.26],[-124.3,129.3],[-124.95,129.26],
    [-125.59,129.13],[-126.21,128.92],[-126.8,128.63],
    [-127.34,128.27],[-127.84,127.84],[-128.27,127.34],
    [-128.63,126.8],[-128.92,126.21],[-129.13,125.59],
    [-129.26,124.95],[-129.3,124.3],[-129.26,123.65],
    [-124.4,66.63],[-124.25,65.52],[-123.97,64.43],
    [-123.58,63.39],[-123.07,62.39],[-122.46,61.45],
    [-121.75,60.58],[-120.95,59.8],[-120.07,59.1],
    [-61.2,12],[-61.2,0],[-28.78,0],
    [-29.82,6.25],[-20.73,6.25],[-21.78,0],
    [-3.5,0],[-4.55,6.25],[4.55,6.25],
    [3.5,0],[21.78,0],[20.73,6.25],
    [29.82,6.25],[28.78,0],[61.2,0],
    [61.2,12],[120.07,59.1],[120.95,59.8],
    [121.75,60.58],[122.46,61.45],[123.07,62.39],
    [123.58,63.39],[123.97,64.43],[124.25,65.52],
    [124.4,66.63],[129.26,123.65],[129.3,124.3],
    [129.26,124.95],[129.13,125.59],[128.92,126.21],
    [128.63,126.8],[128.27,127.34],[127.84,127.84],
    [127.34,128.27],[126.8,128.63],[126.21,128.92],
    [125.59,129.13],[124.95,129.26],[124.3,129.3],
    [123.65,129.26],[123.01,129.13],[122.39,128.92],
    [121.8,128.63],[121.26,128.27],[120.76,127.84],
    [117.05,123.34],[111.12,120.55],[-111.12,120.55]]);
        translate([0,0,Ht])
        Y_BedFemaleBumpUp();
    }
}
module Male()
{
    union()
    {
        linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[61.2,-12],[120.07,-59.1],[120.95,-59.8],
    [121.75,-60.58],[122.46,-61.45],[123.07,-62.39],
    [123.58,-63.39],[123.97,-64.43],[124.25,-65.52],
    [124.4,-66.63],[129.26,-123.65],[129.3,-124.3],
    [129.26,-124.95],[129.13,-125.59],[128.92,-126.21],
    [128.63,-126.8],[128.27,-127.34],[127.84,-127.84],
    [127.34,-128.27],[126.8,-128.63],[126.21,-128.92],
    [125.59,-129.13],[124.95,-129.26],[124.3,-129.3],
    [123.65,-129.26],[123.01,-129.13],[122.39,-128.92],
    [121.8,-128.63],[121.26,-128.27],[120.76,-127.84],
    [117.05,-123.34],[111.12,-120.55],[-111.12,-120.55],
    [-117.05,-123.34],[-120.76,-127.84],[-121.26,-128.27],
    [-121.8,-128.63],[-122.39,-128.92],[-123.01,-129.13],
    [-123.65,-129.26],[-124.3,-129.3],[-124.95,-129.26],
    [-125.59,-129.13],[-126.21,-128.92],[-126.8,-128.63],
    [-127.34,-128.27],[-127.84,-127.84],[-128.27,-127.34],
    [-128.63,-126.8],[-128.92,-126.21],[-129.13,-125.59],
    [-129.26,-124.95],[-129.3,-124.3],[-129.26,-123.65],
    [-124.4,-66.63],[-124.25,-65.52],[-123.97,-64.43],
    [-123.58,-63.39],[-123.07,-62.39],[-122.46,-61.45],
    [-121.75,-60.58],[-120.95,-59.8],[-120.07,-59.1],
    [-61.2,-12],[-61.2,0],[-28.37,0],
    [-29.35,5.85],[-21.2,5.85],[-22.18,0],
    [-3.09,0],[-4.07,5.85],[4.07,5.85],
    [3.09,0],[22.18,0],[21.2,5.85],
    [29.35,5.85],[28.37,0],[61.2,0]]);
        translate([0,0,Ht])
        Y_BedMaleBumpUp();
    }
}
module Female2()
{
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[-61.2,0],[-61.2,12],[-60.47,47.64],
    [60.47,47.64],[61.2,12],[61.2,0],
    [28.78,0],[29.82,6.25],[20.73,6.25],
    [21.78,0],[3.5,0],[4.55,6.25],
    [-4.55,6.25],[-3.5,0],[-21.78,0],
    [-20.73,6.25],[-29.82,6.25],[-28.78,0]]);
}

module Male2()
{
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
        [[-61.2,0],[-61.2,-12],[-60.47,-47.64],
    [60.47,-47.64],[61.2,-12],[61.2,0],
    [28.37,0],[29.35,5.85],[21.2,5.85],
    [22.18,0],[3.09,0],[4.07,5.85],
    [-4.07,5.85],[-3.09,0],[-22.18,0],
    [-21.2,5.85],[-29.35,5.85],[-28.37,0]]);
}
module AlumFrame()
{
    linear_extrude(height = Ht, center = false, convexity = 10)polygon(points = 
    [[-120.07,59.1],[-61.2,12],[-61.2,-12],[-120.07,-59.1],
    [-120.95,-59.8],[-121.75,-60.58],[-122.46,-61.45],[-123.07,-62.39],
    [-123.58,-63.39],[-123.97,-64.43],[-124.25,-65.52],[-124.4,-66.63],
    [-129.26,-123.65],[-129.3,-124.3],[-129.26,-124.95],[-129.13,-125.59],
    [-128.92,-126.21],[-128.63,-126.8],[-128.27,-127.34],[-127.84,-127.84],
    [-127.34,-128.27],[-126.8,-128.63],[-126.21,-128.92],[-125.59,-129.13],
    [-124.95,-129.26],[-124.3,-129.3],[-123.65,-129.26],[-123.01,-129.13],
    [-122.39,-128.92],[-121.8,-128.63],[-121.26,-128.27],[-120.76,-127.84],
    [-78.79,-77.09],[-72.24,-74.01],[72.24,-74.01],[78.79,-77.09],
    [120.76,-127.84],[121.26,-128.27],[121.8,-128.63],[122.39,-128.92],
    [123.01,-129.13],[123.65,-129.26],[124.3,-129.3],[124.95,-129.26],
    [125.59,-129.13],[126.21,-128.92],[126.8,-128.63],[127.34,-128.27],
    [127.84,-127.84],[128.27,-127.34],[128.63,-126.8],[128.92,-126.21],
    [129.13,-125.59],[129.26,-124.95],[129.3,-124.3],[129.26,-123.65],
    [124.4,-66.63],[124.25,-65.52],[123.97,-64.43],[123.58,-63.39],
    [123.07,-62.39],[122.46,-61.45],[121.75,-60.58],[120.95,-59.8],
    [120.07,-59.1],[61.2,-12],[61.2,12],[120.07,59.1],
    [120.95,59.8],[121.75,60.58],[122.46,61.45],[123.07,62.39],
    [123.58,63.39],[123.97,64.43],[124.25,65.52],[124.4,66.63],
    [129.26,123.65],[129.3,124.3],[129.26,124.95],[129.13,125.59],
    [128.92,126.21],[128.63,126.8],[128.27,127.34],[127.84,127.84],
    [127.34,128.27],[126.8,128.63],[126.21,128.92],[125.59,129.13],
    [124.95,129.26],[124.3,129.3],[123.65,129.26],[123.01,129.13],
    [122.39,128.92],[121.8,128.63],[121.26,128.27],[120.76,127.84],
    [78.79,77.09],[72.24,74.01],[-72.24,74.01],[-78.79,77.09],
    [-120.76,127.84],[-121.26,128.27],[-121.8,128.63],[-122.39,128.92],
    [-123.01,129.13],[-123.65,129.26],[-124.3,129.3],[-124.95,129.26],
    [-125.59,129.13],[-126.21,128.92],[-126.8,128.63],[-127.34,128.27],
    [-127.84,127.84],[-128.27,127.34],[-128.63,126.8],[-128.92,126.21],
    [-129.13,125.59],[-129.26,124.95],[-129.3,124.3],[-129.26,123.65],
    [-124.4,66.63],[-124.25,65.52],[-123.97,64.43],[-123.58,63.39],
    [-123.07,62.39],[-122.46,61.45],[-121.75,60.58],[-120.95,59.8]]);
}
module TaperBumpsFemale()
{
//Taper Bump at dovetail Joints
        translate([-43.5,10.25,Ht])
        rotate([0,0,45])
        cylinder(d1=12.7,d2=28.73,h=8,$fn=4);
        translate([43.5,10.25,Ht])
        rotate([0,0,45])
        cylinder(d1=12.7,d2=28.73,h=8,$fn=4);
//Taper Bump near X_Supports
        translate([-47.38,6.06,Ht])
        rotate([0,0,6.3348])
        cylinder(d1=12.7,d2=28.73,h=8,$fn=4);
        translate([47.38,6.06,Ht])
        rotate([0,0,-6.3348])
        cylinder(d1=12.7,d2=28.73,h=8,$fn=4);
}
module TaperBumpsMale()
{
//Taper Bump at dovetail Joints
        translate([-43.5,-4,Ht])
        rotate([0,0,45])
        cylinder(d1=12.73,d2=28.73,h=8,$fn=4);
        translate([43.5,-4,Ht])
        rotate([0,0,45])
        cylinder(d1=12.73,d2=28.73,h=8,$fn=4);
//Taper Bump near X_Supports
        translate([-47.38,-6.06,Ht])
        rotate([0,0,-6.3348])
        cylinder(d1=12.73,d2=28.73,h=8,$fn=4);
        translate([47.38,-6.06,Ht])
        rotate([0,0,6.3348])
        cylinder(d1=12.73,d2=28.73,h=8,$fn=4);
}
module Cut1()
{
        translate([0,0,-1])
        linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[-105.47,-98.36],[-112.8,-95.37],[-111.91,-84.97],
    [-102.85,-58.14],[-51.13,-16.75],[-47.57,-15.5],
    [-35.84,-15.5],[-35.84,-20.26],[-53.68,-43.57],
    [-73.51,-55.01],[-85.1,-69.03],[-87.93,-77.15],
    [-105.47,-98.36]]);
}
module Cut2()
{
        translate([0,0,-1])
        linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[105.47,-98.36],[112.8,-95.37],[111.91,-84.97],
    [102.85,-58.14],[51.13,-16.75],[47.57,-15.5],
    [35.84,-15.5],[35.84,-20.26],[53.68,-43.57],
    [73.51,-55.01],[85.1,-69.03],[87.93,-77.15],
    [105.47,-98.36]]);
}
//1st Triangle cut
module Cut3()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[-19.75,-18.97],[-24.64,-15.5],[-62.44,-64.88],
    [-60.93,-68.01],[-23.75,-68.01],[-19.75,-64.01]]);
}
//2nd Triangle Cut
module Cut4()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[19.75,-18.97],[24.64,-15.5],[62.44,-64.88],
    [60.93,-68.01],[23.75,-68.01],[19.75,-64.01]]);
}
module Cut5()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[-9.75,-68.01],[9.75,-68.01],[13.75,-64.01],
    [13.75,-32.88],[9.75,-28.88],[-9.75,-28.88],
    [-13.75,-32.88],[-13.75,-64.01]]);
}
module Cut6()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[-49.63,-78.01],[-49.63,-110.55],[-53.63,-114.55],
    [-107.45,-114.55],[-108.77,-111.76],[-82.2,-79.64],
    [-70.23,-74.01],[-53.63,-74.01]]);
}
module Cut7()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[-7,-74.01],[-3,-78.01],[-3,-110.55],
    [-7,-114.55],[-39.63,-114.55],[-43.63,-110.55],
    [-43.63,-78.01],[-39.63,-74.01]]);
}
module Cut8()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[7,-74.01],[3,-78.01],[3,-110.55],
    [7,-114.55],[39.63,-114.55],[43.63,-110.55],
    [43.63,-78.01],[39.63,-74.01]]);
}
module Cut9()
{
    translate([0,0,-1])
    linear_extrude(height = Ht+2, center = false, convexity = 10)polygon(points = 
    [[49.63,-78.01],[49.63,-110.55],[53.63,-114.55],
    [107.45,-114.55],[108.77,-111.76],[82.2,-79.64],
    [70.23,-74.01],[53.63,-74.01]]);
}
module WrenchWheelLtRt()
{
    translate([-(WheelHoleRt-3.41),-69.34,Ht])
    cylinder(d=20,h=10);
    translate([WheelHoleRt-3.41,-69.34,Ht])
    cylinder(d=20,h=10);
}
module CutsMale()
{
    Cut1();
    Cut2();
    Cut3();
    Cut4();
    Cut5();
    Cut6();
    Cut7();
    Cut8();
    Cut9();
//Hole for Male Left Glass Mount
    translate([-124.3,-124.3,-1])
    cylinder(d=M3,h=10);
//Hole for Male Right Glass Mount
    translate([124.3,-124.3,-1])
    cylinder(d=M3,h=10);
//Wheel Holes
    translate([WheelHoleLt,-67.19,-1])
    cylinder(d=M5,h=10);
    translate([WheelHoleRt,-67.19,-1])
    cylinder(d=M5,h=10);
//Cut around bumps so wheel nuts will fit
    translate([WheelHoleLt,-67.19,Ht])
    cylinder(d=9.5,h=10);
    translate([WheelHoleRt,-67.19,Ht])
    cylinder(d=9.5,h=10);
//extra 2 holes for sizing
//    translate([-114.19,-103.5,Ht])
//    cylinder(d=9.5,h=10);
//    translate([114.19,-103.5,Ht])
//    cylinder(d=9.5,h=10);

    WrenchWheelLtRt();
//extra 2 holes for sizing
//    translate([-114.19,-103.5,-1])
//    cylinder(d=M5,h=10);
//    translate([114.19,-103.5,-1])
//    cylinder(d=M5,h=10); 
// Belt Clamp Mounting hole
    translate([0,-19,-1])
    cylinder(d=M5,h=10);
//Optional longer hole for longer clamp
    translate([0,-59,-1])
    cylinder(d=M5,h=10);
//Mounting Plate Left Hole
    translate([-45,-7.75,-1])
    cylinder(d=M5,h=10); 
//Mounting Plate Right Hole
    translate([45,-7.75,-1])
    cylinder(d=M5,h=10);
//Hole for Limit Switch bolt on either side
//Put this hole in all possible 4 spots it might go
    translate([73.6625,-61.7625,-1])
    cylinder(d=M3,h=10);
    translate([-73.6625,-61.7625,-1])
    cylinder(d=M3,h=10);
}
module CutsFemale()
{
    Cut1();
    Cut2();
    Cut3();
    Cut4();
    Cut5();
    Cut6();
    Cut7();
    Cut8();
    Cut9();
//Hole for Female Left Glass Mount
    translate([-124.3,-124.3,-1])
    cylinder(d=M3,h=10);
//Hole for Female Right Glass Mount
    translate([124.3,-124.3,-1])
    cylinder(d=M3,h=10);
//Wheel Holes
    translate([WheelHoleLt,-67.19,-1])
    cylinder(d=M5,h=10);
    translate([WheelHoleRt,-67.19,-1])
    cylinder(d=M5,h=10);
//Cut around bumps so wheel nuts will fit
    translate([WheelHoleLt,-67.19,Ht])
    cylinder(d=9.5,h=10);
    translate([WheelHoleRt,-67.19,Ht])
    cylinder(d=9.5,h=10);
//extra 2 holes for sizing
//    translate([-114.19,-103.5,Ht])
//    cylinder(d=9.5,h=10);
//    translate([114.19,-103.5,Ht])
//    cylinder(d=9.5,h=10);
    WrenchWheelLtRt();
//extra 2 holes for sizing
//    translate([-114.19,-103.5,-1])
//    cylinder(d=M5,h=10);
//    translate([114.19,-103.5,-1])
//    cylinder(d=M5,h=10);
// Belt Clamp Mounting hole
    translate([0,-19,-1])
    cylinder(d=M5,h=10);
//Optional longer hole for longer clamp
    translate([0,-59,-1])
    cylinder(d=M5,h=10);
//Mounting Plate Left Hole
    translate([-45,-7.75,-1])
    cylinder(d=M5,h=10); 
//Mounting Plate Right Hole
    translate([45,-7.75,-1])
    cylinder(d=M5,h=10); 
//Hole for Limit Switch bolt on either side
//Put this hole in all possible 4 spots it might go
    translate([73.6625,-61.7625,-1])
    cylinder(d=M3,h=10);
    translate([-73.6625,-61.7625,-1])
    cylinder(d=M3,h=10);
}
module EccentricHole()
{
    union()
    {
        translate([0,0,-1])
        cylinder(d=M7,h=4.5);
        translate([0,0,-1])
        cylinder(d=M5,h=4.5);
    }
}
module EccMale()
{
        translate([WheelHoleRt,-67.19,-1])
        EccentricHole();
        //translate([114.19,-103.5,-1])
        //EccentricHole();
}
module EccFemale()
{
        translate([WheelHoleRt,67.19,-1])
        EccentricHole();
        //translate([114.19,103.5,-1])
        //EccentricHole();
}
module EarsFemale()
{
//Ear at Lower Left Glass Mount hole
    GlassMntLt();
//Ear at Lower Right Glass Mount hole
  GlassMntRt();  
//Ear at Left Butt Joint
    EarButtLt();
//Ear at Right Butt Joint
    EarButtRt();
//Ear at Lower Left Wheel Hole
    translate([-126.08,-79.06,0])
    cylinder(d=20,h=EarHt);
    translate([-119.0,-86.13,0])
    rotate([0,0,45])
    cube([12.83,20,EarHt]);
    translate([-121.89,-65.09,0])
    rotate([0,0,45])
    cube([3.08,3.08,EarHt]);
//Ear at Lower Right Wheel Hole
    translate([126.08,-79.06,0])
    cylinder(d=20,h=EarHt);
    translate([109.93,-77.06,0])
    rotate([0,0,-45])
    cube([12.83,20,EarHt]);
    translate([119.71,-62.91,0])
    rotate([0,0,-45])
    cube([3.08,3.08,EarHt]);
}
module EarsMale()
{
//Ear at Lower Left Glass Mount hole
    GlassMntLt();
//Ear at Lower Right Glass Mount hole
  GlassMntRt();  
//Ear at Left Butt Joint
    EarButtLt();
//Ear at Right Butt Joint
    EarButtRt();
//Ear at Lower Left Wheel Hole
    translate([-126.08,-79.06,0])
    cylinder(d=20,h=EarHt);
    translate([-119.0,-86.13,0])
    rotate([0,0,45])
    cube([12.83,20,EarHt]);
    translate([-121.89,-65.09,0])
    rotate([0,0,45])
    cube([3.08,3.08,EarHt]);
//Ear at Lower Right Wheel Hole
    translate([126.08,-79.06,0])
    cylinder(d=20,h=EarHt);
    translate([109.93,-77.06,0])
    rotate([0,0,-45])
    cube([12.83,20,EarHt]);
    translate([119.71,-62.91,0])
    rotate([0,0,-45])
    cube([3.08,3.08,EarHt]);
//Ear at end of Wire Tail
}
module EarButtLt()
{
    linear_extrude(height = EarHt, center = false, convexity = 10)polygon(points = 
    [[-59.23,4.16],[-64.18,0.17],[-65.67,-1.65],
    [-66.78,-3.73],[-67.47,-5.98],[-67.7,-8.32],
    [-67.47,-10.66],[-66.78,-12.92],[-65.67,-14.99],
    [-64.18,-16.81],[-62.36,-18.3],[-60.29,-19.41],
    [-58.04,-20.1],[-55.69,-20.33],[-53.35,-20.1],
    [-51.1,-19.41],[-49.02,-18.3],[-47.29,-16.88],
    [-44.08,-14.31],[-42.58,-12.49],[-41.48,-10.41],
    [-40.79,-8.16],[-40.56,-5.82],[-40.79,-3.48],
    [-41.48,-1.23],[-42.58,0.85],[-44.08,2.67],
    [-45.9,4.16],[-47.97,5.27],[-50.22,5.95],
    [-52.57,6.18],[-54.91,5.95],[-57.16,5.27]]);
}
module EarButtRt()
{
    linear_extrude(height = EarHt, center = false, convexity = 10)polygon(points = 
    [[59.23,4.16],[64.18,0.17],[65.67,-1.65],
    [66.78,-3.73],[67.47,-5.98],[67.7,-8.32],
    [67.47,-10.66],[66.78,-12.92],[65.67,-14.99],
    [64.18,-16.81],[62.36,-18.3],[60.29,-19.41],
    [58.04,-20.1],[55.69,-20.33],[53.35,-20.1],
    [51.1,-19.41],[49.02,-18.3],[47.29,-16.88],
    [44.08,-14.31],[42.58,-12.49],[41.48,-10.41],
    [40.79,-8.16],[40.56,-5.82],[40.79,-3.48],
    [41.48,-1.23],[42.58,0.85],[44.08,2.67],
    [45.9,4.16],[47.97,5.27],[50.22,5.95],
    [52.57,6.18],[54.91,5.95],[57.16,5.27]]);
}
module GlassMntLt()
{
    linear_extrude(height = EarHt, center = false, convexity = 10)polygon(points = 
    [[-114.2,-121.2],[-113.28,-122.93],[-112.71,-124.81],
    [-112.51,-126.76],[-112.71,-128.71],[-113.28,-130.58],
    [-114.2,-132.31],[-115.44,-133.83],[-116.96,-135.07],
    [-118.69,-136],[-120.56,-136.57],[-122.51,-136.76],
    [-124.47,-136.57],[-126.34,-136],[-128.07,-135.07],
    [-129.59,-133.83],[-131.71,-131.71],[-132.95,-130.19],
    [-133.87,-128.46],[-134.44,-126.59],[-134.64,-124.64],
    [-134.44,-122.69],[-133.87,-120.81],[-132.95,-119.08],
    [-131.71,-117.56],[-130.19,-116.32],[-128.46,-115.4],
    [-126.59,-114.83],[-124.64,-114.64],[-122.69,-114.83],
    [-120.81,-115.4],[-119.08,-116.32],[-117.56,-117.56],
    [-115.44,-119.69]]);
}
module GlassMntRt()
{
    linear_extrude(height = EarHt, center = false, convexity = 10)polygon(points = 
    [[114.2,-121.2],[113.28,-122.93],[112.71,-124.81],
    [112.51,-126.76],[112.71,-128.71],[113.28,-130.58],
    [114.2,-132.31],[115.44,-133.83],[116.96,-135.07],
    [118.69,-136],[120.56,-136.57],[122.51,-136.76],
    [124.47,-136.57],[126.34,-136],[128.07,-135.07],
    [129.59,-133.83],[131.71,-131.71],[132.95,-130.19],
    [133.87,-128.46],[134.44,-126.59],[134.64,-124.64],
    [134.44,-122.69],[133.87,-120.81],[132.95,-119.08],
    [131.71,-117.56],[130.19,-116.32],[128.46,-115.4],
    [126.59,-114.83],[124.64,-114.64],[122.69,-114.83],
    [120.81,-115.4],[119.08,-116.32],[117.56,-117.56],
    [115.44,-119.69]]);
}

module EarsMaleCut()
{
    difference()
    {
        EarsMale();
        CutsMale();
    }
}
module EarsFemaleCut()
{
    difference()
    {
        EarsMale();
        CutsMale();
    }
}

module MaleAndFemale()
{
    difference()
    {
        Male();
        CutsMale();

        EccMale();
        BrassBarCut();
    }  
    difference()
    {
        Female();
        rotate([0,0,180])
        CutsFemale();
        EccFemale();
        BrassBarCut();
    } 
}
////////////////////////////////
/// Draw the Different parts ///
////////////////////////////////
if (Side == 1)
{
    difference()
    {
    translate([0,0,0])
%BrassBars();
    union()
    {
        difference()
        {
            Male();
            CutsMale();
            TaperBumpsMale();
            EccMale();
            BrassBarCut();
            
        }
        if (DrawEars == 1)
        {
            EarsMaleCut();

        }
        //BrassBars();
    }
    //Test Cut
    //translate([-150,-95,-20])
    //cube([300,30,40]);
//    translate([5,-150,-20])
//    cube([300,300,40]);
//    translate([-150,-35,-20])
//    cube([300,300,40]);
}
}
//Added these extra ears for test print
//            translate([0,-114.3,0])
//            cylinder(d=20,h=EarHt);   
//            translate([0,-71,0])
//            cylinder(d=20,h=EarHt); 
//            translate([-16.75,-39,0])
//            cylinder(d=20,h=EarHt); 
//            translate([-46.41,-39,0])
//            cylinder(d=20,h=EarHt); 
//            translate([-85,-39,0])
//            cylinder(d=25,h=EarHt); 
if (Side == 0)
{
    translate([0,0,0])
    rotate([0,0,180])
    %BrassBars();
    union()
    {
        difference()
        {
            Female();
            rotate([0,0,180])
            CutsFemale();
            TaperBumpsFemale();
            EccFemale();
            rotate([0,0,180])
            BrassBarCut();
        }
        if (DrawEars == 1)
        {
            rotate([0,0,180])
            EarsFemaleCut();
        }
    }
}
if (Side == 4)
{
    union()
    {
        difference()
        {
            MaleAndFemale();
            TaperBumpsMale();
            TaperBumpsFemale();
            BrassBarCut();
            rotate([0,0,180])
            BrassBarCut();
        }
        if (DrawEars == 1)
        {
            rotate([0,0,180])
            EarsFemaleCut();
            EarsMaleCut();
        }
    }
    %BrassBars();
    rotate([0,0,180])
    %BrassBars();
}
if (Side == 2)
{
    difference()
    {
        AlumFrame();
        CutsMale();
        EccMale();
        rotate([0,0,180])
        CutsFemale();
        EccFemale();
    }
}
module TestCuts()
{
    translate([-65,-60,-1])
    cube([30,38,10]);
    translate([35,-60,-1])
    cube([30,38,10]);
}
if (Side == 3)
{
    difference()
    {
        Male2();
        CutsMale();
        TestCuts();
    }
    translate([0,10,0])
    difference()
    {
        Female2();
        rotate([0,0,180])
        CutsFemale();
        rotate([0,0,180])
        TestCuts();
    }
}

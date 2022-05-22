$fn = $preview ? 12 : 120;

module voron_logo() {
    difference(){
        square(92,center=true);
        translate([-65, -75])import("Voron Design Logo SVG.svg");
    }
}

module m3_printable_counterbore() {
    intersection() {
        union() {
            translate([-3.1, -3.1, -0.4])cube([1.4, 6.2, 0.4]);
            translate([1.7, -3.1, -0.4])cube([1.4, 6.2, 0.4]);
            translate([-3.1, -3.1, -0.2])cube([6.2, 1.4, 0.2]);
            translate([-3.1, 1.7, -0.2])cube([6.2, 1.4, 0.2]);
        }
        cylinder(h=1, d=6.1, center=true);
    }
}

module case_footprint() {
    difference() {
        square([170,71.9]);

        translate([-0.2, 66.7])square([8.4,5.4]);
        translate([-1,65.1])square(2.6);
        translate([7.2,70.3])square(2.6);

        translate([161.8, 66.7])square([8.4,5.4]);
        translate([160.2,70.3])square(2.6);
        translate([168.4,65.1])square(2.6);

        translate([-1,-1])square(6);
        translate([165,-1])square(6);
    }
    translate([1.6, 65.1])circle(r=1.6);
    translate([9.8,70.3])circle(r=1.6);

    translate([160.2, 70.3])circle(r=1.6);
        translate([168.4,65.1])circle(r=1.6);

    translate([5,5])circle(r=5);
    translate([165,5])circle(r=5);
}

module rear_case() {
    difference() {
        union() {
            difference(){
                minkowski() {
                    linear_extrude(12.2)offset(r=-0.8)difference()case_footprint();
                    cylinder(h=0.8, r1=0, r2=0.8);
                }
                translate([0,0,1.6])linear_extrude(13)offset(r=-1.6)case_footprint();
            }
            translate([16.2, 2.35, 1.5]){
                translate([4, 4, 0])cylinder(h=9.8, d=8);
                translate([0, -2, 0])cube([8, 6, 9.8]);
                translate([139.65, 4, 0])cylinder(h=9.8, d=8);
                translate([135.65, -2, 0])cube([8, 6, 9.8]);
                translate([4, 63.25, 0])cylinder(h=9.8, d=8);
                translate([0, 63.25, 0])cube([8, 6, 9.8]);
                translate([139.65, 63.25, 0])cylinder(h=9.8, d=8);
                translate([135.65, 63.25, 0])cube([8, 6, 9.8]);
            }
            translate([1.6, 1.6, 1.5])cube([166.8, 3, 7.1]);
            translate([8.2, 67.3, 1.5])cube([153.6, 3, 7.1]);
            translate([0,36.9, 1.5])cube([170,9,6.1]);
        }
        translate([16.2, 2.35, -1]){
            translate([4, 4, 0])cylinder(h=6, d=6);
            translate([4, 4, 0])cylinder(h=20, d=3.4);
            translate([139.65, 4, 0])cylinder(h=6, d=6);
            translate([139.65, 4, 0])cylinder(h=20, d=3.4);
            translate([4, 63.25, 0])cylinder(h=6, d=6);
            translate([4, 63.25, 0])cylinder(h=20, d=3.4);
            translate([139.65, 63.25, 0])cylinder(h=6, d=6);
            translate([139.65, 63.25, 0])cylinder(h=20, d=3.4);
            translate([22.2, 55.5, 0])cube([95.2, 9.1, 3]);
        }
        translate([67, 41.4, -1])cylinder(h=5,d=4.7);
        translate([67, 41.4, -1])cylinder(h=7.6,d=3.2);
        translate([103, 41.4, -1])cylinder(h=5,d=4.7);
        translate([103, 41.4, -1])cylinder(h=7.6,d=3.2);
    }
    translate([16.2, 2.35, 0]){
        translate([4, 4, 5])m3_printable_counterbore();
        translate([139.65, 4, 5])m3_printable_counterbore();
        translate([4, 63.25, 5])m3_printable_counterbore();
        translate([139.65, 63.25, 5])m3_printable_counterbore();
    }
    translate([67, 41.4, 4])m3_printable_counterbore();
    translate([103, 41.4, 4])m3_printable_counterbore();
}

module handle(){
    difference() {
        minkowski(){
            difference() {
                translate([-1,0.8,0])cube([4.2,49.4, 4.2]);
                translate([4,0,-1])cylinder(h=7,r=3.8);
                translate([4,51,-1])cylinder(h=7,r=3.8);
            }
            cylinder(h=0.8, r1=0.8, r2=0);
        }
        translate([4,0,0])rotate([-90,0,0])cylinder(h=51, r=3);
        translate([-2, -1, -1])cube([1, 53, 7]);
    }
}

module front_case() {
    difference() {
        union() {
            translate([0,0,-7.0])difference(){
                minkowski() {
                    linear_extrude(6.2)offset(r=-0.8)difference(){
                        case_footprint();
                        translate([16.2,2.35])translate([20.25,8.05])square([97.1,56.0]);
                    }
                    cylinder(h=0.8, r1=0.8, r2=0);
                }
                translate([0,0,-1])linear_extrude(6.4)offset(r=-1.6)case_footprint();
            }
            translate([16.2, 2.35, -7]){
                translate([4, 4, 0])cylinder(h=5.4, d=8);
                translate([0, -2, 0])cube([8, 6, 5.4]);
                translate([139.65, 4, 0])cylinder(h=5.4, d=8);
                translate([135.65, -2, 0])cube([8, 6, 5.4]);
                translate([4, 63.25, 0])cylinder(h=5.4, d=8);
                translate([0, 63.25, 0])cube([8, 6, 5.4]);
                translate([139.65, 63.25, 0])cylinder(h=5.4, d=8);
                translate([135.65, 63.25, 0])cube([8, 6, 5.4]);
            }
            translate([9.7, 66.9, -7])cube([21.5,3.5,5.5]);
            translate([138.8, 66.9, -7])cube([21.5,3.5,5.5]);
            translate([1,12,-5])mirror([1,0,0])handle();
            translate([169, 12, -5])handle();
        }
        translate([16.2,2.35,0]){ 
            translate([134.7,32.2,-2.0])cylinder(h=3, d=21);
            translate([135.5, 12.5, -2.0])cylinder(h=3, d=4);
        }
        translate([16.2, 2.35, -8]){
            translate([4, 4, 0])cylinder(h=5, d=4.7);
            translate([4, 4, 0])cylinder(h=6.4, d=3.4);
            translate([139.65, 4, 0])cylinder(h=5, d=4.7);
            translate([139.65, 4, 0])cylinder(h=6.4, d=3.4);
            translate([4, 63.25, 0])cylinder(h=5, d=4.7);
            translate([4, 63.25, 0])cylinder(h=6.4, d=3.4);
            translate([139.65, 63.25, 0])cylinder(h=5, d=4.7);
            translate([139.65, 63.25, 0])cylinder(h=6.4, d=3.4);
        }
        translate([0,71.9,0])rotate([0,90,0])linear_extrude(170)difference(){
            polygon([
                [-1,1],
                [2.5,1],
                [2.5,-0.732],
                [0.732,-0.732],
                [0,-1.464],
                [-1,-1.464]]);
            translate([2.5,-2.5])circle(r=2.5);
        }
        translate([1, 69.4, -2.5])rotate([0,90,0])cylinder(h=25, d=2.2);
        translate([144, 69.4, -2.5])rotate([0,90,0])cylinder(h=25, d=2.2);
        translate([18.2,36,-1.8])linear_extrude(2.0)scale([0.2,0.2])voron_logo();
    }
}

module logo_insert() {
    cylinder(h=5.4,d=24);
    linear_extrude(7.4)scale([0.2,0.2])voron_logo();
}

module hinge() {
    difference() {
        union(){
            linear_extrude(8)difference(){
                union() {
                    translate([2.5,-2.5])circle(r=2.5);
                    translate([2.5,-5])square([17.5,5]);
                    translate([0, -2.5])square(2.5);
                    translate([7,0])square([6,0.6]);
                }
                translate([2.5, -2.5])circle(d=2.2);
            }
            translate([1.2,-3.8,0])cube([2.6, 2.6,1]);
        }
        translate([10,-2,4])rotate([90,0,0])cylinder(h=4, d=6);
        translate([10,1,4])rotate([90,0,0])cylinder(h=10, d=3.4);
    }
}

module position_block() {
    difference() {
        linear_extrude(28, center=true) {
            difference() {
                union() {
                    translate([-5, -27])square([5, 42]);
                    translate([-15, -27])square([15,5]);
                    translate([-1, 7])square([1.6, 6]);
                    translate([-18,10])square([18, 5]);
                    translate([17.5,-2.5])difference() {
                        circle(41.5);
                        circle(35);
                        translate([-40, 17.5])square([80,25]);
                        translate([-16,-45])square([60,90]);
                        translate([-40, -64.5])square([40,40]);
                    }
                }
                translate([17.5, -2.5]) {
                    for (theta = [164:7.5:209])
                        translate([33.5 * cos(theta), 33.5 * sin(theta)])circle(3);
                }
                translate([17.5, -2.5]) {
                    circle(18);
                }
            }
        }
        translate([-17,10,0])rotate([0,90,0])cylinder(h=13, d=9.6);
        translate([-8,10,0])rotate([0,90,0])cylinder(h=10, d=5.2);
        translate([-25,10,0])rotate([0,90,0])cylinder(h=25, d=3.6);
    }
}

module brace_single() {
    linear_extrude(7,center=true) {
        difference() {
            translate([17.5, -2.5])union(){
                difference() {
                    circle(39);
                    circle(31);
                    polygon([[0,0],[1,50],[50*cos(164),50*sin(164)]]);
                }
                translate([35*cos(164),35*sin(164)])circle(r=4);
            }
            translate([0,-45])square([90,90]);
        }
    }
}

module rear_brace() {
    difference() {
        union() {
            translate([0,0,-18])brace_single();
            translate([0,0,18])brace_single();
            linear_extrude(35, center=true) {
                difference() {
                    translate([17.5, -2.5])difference() {
                        circle(39);
                        circle(31);
                    }
                    translate([0,-45])square([90,90]);
                    translate([-45,-27])square([90,90]);
                }
            }
        }
        translate([-15, -30.5, -18])rotate([0,90,0])cylinder(h=16, d=3.4);
        translate([-15, -30.5, -18])rotate([0,90,0])cylinder(h=11, d=6);
        translate([-15, -30.5, 18])rotate([0,90,0])cylinder(h=16, d=3.4);
        translate([-15, -30.5, 18])rotate([0,90,0])cylinder(h=11, d=6);
        translate([-45,-45,-25])cube([90,11,50]);
        
        translate([17.5, -2.5,0])translate([35*cos(164),35*sin(164), 0]){
            translate([0,0,18])cylinder(h=8,d=3,center=true);
            translate([0,0,-18])cylinder(h=8,d=4.7,center=true);
            translate([0,0,-22])cylinder(h=3.5,d=6);
        }
    }
}

module btt_tft43() {
    difference() {
        cube([143.65, 67.25, 1.7]);
        translate([4,4,-0.1])cylinder(h=1.9, d=3.4);
        translate([139.65,4,-0.1])cylinder(h=1.9, d=3.4);
        translate([4,63.25,-0.1])cylinder(h=1.9, d=3.4);
        translate([139.65,63.25,-0.1])cylinder(h=1.9, d=3.4);
    }
    translate([15.25,-0.75, 1.7])difference(){
        cube([107.10, 68.7, 5.4]);
        translate([5,8.8,4.6])cube([97.1,56.0,0.9]);
    }
    translate([134.7, 32.2, 1.7])cylinder(h=20,d=24.5);
    translate([135.5,12.5,1.7])cylinder(h=10,d=3.5);
    translate([8,4,-9.7])cube([127.65,59.25,9.7]);
    translate([0,8,-9.7])cube([143.65,51.25,9.7]);
}

%translate([77,-183,0])import ("front_skirt_a_250.stl");
%translate([-207,-183,0])import ("front_skirt_b_250.stl");
%translate([16.2,-69.55,11.3])btt_tft43();
color("#af231c")translate([0,-71.9,20])front_case();
color("#101820")translate([18.2,-35.9,13])logo_insert();
color("#af231c")translate([0,-71.9,0])rear_case();
color("#101820")translate([85,0,0])rotate([0,270,0])rear_brace();
color("#101820")translate([85,0,0])rotate([0,270,0])position_block();
color("#af231c")translate([0,0,20])rotate([0,90,0])hinge();
color("#af231c")translate([170,0,20])mirror([1,0,0])rotate([0,90,0])hinge();
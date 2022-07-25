use <GT2 profile.scad>

$fn = $preview ? 30 : 120;
epsilon = 0.001;

module m3_printable_counterbore() {
    difference() {
        translate([0, 0, -epsilon])cylinder(h=1.6 + epsilon, d=6);
        translate([-3, -3 - epsilon, 1.4])cube([6, 1.3 + epsilon, 0.2 + epsilon]);
        translate([-3, 1.7, 1.4])cube([6, 1.3 + epsilon, 0.2 + epsilon]);
        translate([-3 - epsilon, -3, 1.2])cube([1.3 + epsilon, 6, 0.4 + epsilon]);
        translate([1.7, -3, 1.2])cube([1.3 + epsilon, 6, 0.4 + epsilon]);
    }
}

module misumi_1515_profile() {
    difference() {
        minkowski(){
            square(13, center=true);
            circle(r=1);
        }
        circle(d = 2.5);
        for(t = [0:90:270])rotate(t)polygon([
            [1.7, -8],
            [1.7, -6.4],
            [2.85, -6.4],
            [2.85, -3.8],
            [1.85, -2.8],
            [-1.85, -2.8],
            [-2.85, -3.8],
            [-2.85, -6.4],
            [-1.7, -6.4],
            [-1.7, -8],
        ]);
    }
}

module extrusion_200_15() {
    linear_extrude(200, convexity=4)misumi_1515_profile();
}

module mgn5c_150() {
    linear_extrude(150) {
        translate([-2.5, 0])square([5, 3.6]);
    }
    translate([-6, 1.5, 0])cube([12, 4.5, 16]);
}

module framing() {
    translate([-107.5, 7.5, 0])extrusion_200_15();
    translate([107.5, 7.5, 0])extrusion_200_15();
    translate([-107.5, 222.5, 0])extrusion_200_15();
    translate([107.5, 222.5, 0])extrusion_200_15();
    translate([-100, 7.5, 7.5])rotate([0, 90, 0])extrusion_200_15();
    translate([-100, 185.5, 7.5])rotate([0, 90, 0])extrusion_200_15();
    translate([-107.5, 15, 7.5])rotate([-90, 0, 0])extrusion_200_15();
    translate([107.5, 15, 7.5])rotate([-90, 0, 0])extrusion_200_15();
}

module bed_attachment() {
    difference() {
        union() {
            translate([-13.5, 6, 0])cube([14, 4.5, 24.6]);
            
            // Bed attachment
            translate([-7.5, 16.4, 21.6])cylinder(h=3, d=12);
            translate([-13.5, 6, 21.6])cube([12, 10.4, 3]);
            translate([-13.5, 0 ,0])rotate([0, 0, 90])rotate([90, 0, 0])linear_extrude(3)polygon([
                [10.5 - epsilon, 15.7],
                [10.5, 15.7],
                [16.4, 21.6],
                [16.4, 21.6 + epsilon],
                [10.5 - epsilon, 21.6 + epsilon],
            ]);
            
            // Belt attachment
            translate([0, 10.5, 0])rotate([90, 0, 0])linear_extrude(4)polygon([
                [0.5 - epsilon, 0],
                [9.7, 0],
                [10.5, 0.8],
                [10.5, 23.8],
                [9.7, 24.6],
                [0.5 - epsilon, 24.6],
            ]);
            // Alignment
            translate([4, 5.5, 23.6])cube([3, 1 + epsilon, 1]);
        }
        
        // M2 holes
        translate([-11.5, 6 - epsilon, 8])rotate([-90, 0, 0])cylinder(h=4.5 + 2 * epsilon, d=2.2);
        translate([-3.5, 6 - epsilon, 8])rotate([-90, 0, 0])cylinder(h=4.5 + 2 * epsilon, d=2.2);
        
        // Bed attachment
        translate([-7.5, 16.4, 20])cylinder(h=5, d=3.1);
        
        translate([5.5, 6.5 - epsilon, 6])rotate([-90, 0, 0])cylinder(h=4 + 2 * epsilon, d=4.7);
        translate([5.5, 6.5 - epsilon, 18.6])rotate([-90, 0, 0])cylinder(h=4 + 2 * epsilon, d=4.7);
    }
}

module belt_attachment() {
    difference() {
        //anslate([0.5, -1.5, 0])cube([10, 8, 24.6]);
        translate([0, 6.5, 0])rotate([90, 0, 0])linear_extrude(8)polygon([
            [0.5, 0],
            [9.7, 0],
            [10.5, 0.8],
            [10.5, 23.8],
            [9.7, 24.6],
            [0.5, 24.6],
        ]);

        // Belt Path
        t1 = 360 / 11;
        t2 = 90 - t1*2;
        angles = [0, 0, 0, 0, t2, t1, t1, t1, t1, t2, 0, 0, 0, 0];
        translate([1.7, 0.5, -1])rotate([0, -90, 0])rotate([-90,0,0])linear_extrude(6 + epsilon)gt2_profile(angles, 0.2);
        translate([0, 0, 24.6])mirror([0, 0, 1])translate([1.7, 0.5, -1])rotate([0, -90, 0])rotate([-90,0,0])linear_extrude(6 + epsilon)gt2_profile(angles, 0.2);

        // Alignment
        translate([4, 5.5, 23.6])cube([3, 1 + epsilon, 1 + epsilon]);

        // Mounting screw
        translate([5.5, -1.5 - epsilon, 6])rotate([-90, 0, 0])cylinder(h=8 + 2 * epsilon, d=3.4);
        translate([5.5, -1.5 - epsilon, 6])rotate([-90, 0, 0])m3_printable_counterbore();
        translate([5.5, -1.5 - epsilon, 18.6])rotate([-90, 0, 0])cylinder(h=8 + 2 * epsilon, d=3.4);
        translate([5.5, -1.5 - epsilon, 18.6])rotate([-90, 0, 0])m3_printable_counterbore();
    }
}

%framing();
%translate([-107.5, 15, 16])mgn5c_150();
%translate([-100, 15, 16])bed_attachment();
translate([-100, 15, 16])belt_attachment();

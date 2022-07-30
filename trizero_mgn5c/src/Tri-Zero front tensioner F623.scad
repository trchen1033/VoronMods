$fn=120;

module tensioner() {
    difference() {
        union() {
            minkowski(){
                translate([0, 0, 0.75])linear_extrude(11.5)polygon([
                    [0.4, 0.75],
                    [23.25, 0.75],
                    [23.25, 2.75],
                    [12.9, 13.1],
                    [0.4, 13.1],
                ]);
                rotate([0,-90,0]) {
                    intersection() {sphere(r=0.75); translate([-1, -1, -1])cube([2, 2, 1]);}
                    cylinder(h=0.4, d1=1.5, d2=0.7);
                }
            }

            minkowski() {
                translate([0.8, -0.5, 6.3])cube([22.05, 0.6, 2.4]);
                rotate([0,-90,0]) {
                    intersection() {sphere(r=0.4); translate([-1, -1, -1])cube([2, 2, 1]);}
                    cylinder(h=0.4, d1=0.8, d2=0);
                }
            }

            translate([4.75, 7.2, 12.9])cylinder(h=1.6, d1=8.85, d2=6);
        }
        translate([4.75, 7.2, 3])cylinder(d=2.85, h=15);
        translate([15, -1, 7.5])rotate([-90,0,0])cylinder(h=20, d=3.4);
        translate([15, 2, 7.5])rotate([-90,0,0])cylinder(h=20, d=6);
        
        translate([-1, 10.5, 7.5])rotate([0,90,0])cylinder(h=15, d=3.4);
        translate([10.5, 10.5, 7.5])rotate([0,90,0])cylinder(h=10, d=6);
        translate([10.5, 10.5, 4.5])cube([10, 5, 6]);
    }
}

rotate([0,-90,0])tensioner();

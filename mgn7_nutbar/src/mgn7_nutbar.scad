$fn=120;

difference() {
    minkowski() {
        translate([-71.5, -1.75, 0])cube([143, 3.5, 2.5]);
        cylinder(h=0.3, r1=0.7, r2=1);
    }
    for(x=[-67.5:15:67.5]) {
        translate([x, 0, 2.4])cylinder(h=0.5, d=5.2);
        translate([x - 1.43, -2.8, 2.4])cube([2.86,5.6, 0.5]);
        translate([x, 0, 0.8])linear_extrude(1.7)polygon([for(i=[0:5])[cos(i*60),sin(i*60)]*4.2/sqrt(3)]);
        translate([x, 0, -0.1])cylinder(h=1, d=2.4);
    }
}
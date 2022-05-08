$fn=120;

module base() {
    projection()import("pepe housing mask.stl");
}

module base_mask() {
    base();
    translate([83,187.5])square([182.5,143.3]);
    translate([260,193])square([17,132]);
    translate([75,218])circle(d=6);
    translate([75,259])circle(d=6);
    translate([75,300])circle(d=6);
}

module _base_mod() {
    minkowski() {
        base();
        circle(r=0.75);
    }
}

module base_hole_shrink(){
    difference() {
        base();
        translate([83,187.5])square([182.5,5]);
        translate([83,325.5])square([182.5,5]);
        translate([75,218])circle(d=6);
        translate([75,259])circle(d=6);
        translate([75,300])circle(d=6);
        translate([247.7916,200])square([28.4,110]);
    }
    intersection() {
        _base_mod();
        translate([83,187.5])square([182.5,5]);
    }
    intersection() {
        _base_mod();
        translate([83,325.5])square([182.5,5]);
    }
    intersection() {
        _base_mod();
        translate([75,218])circle(d=6);
    }
    intersection() {
        _base_mod();
        translate([75,259])circle(d=6);
    }
    intersection() {
        _base_mod();
        translate([75,300])circle(d=6);
    }
}

linear_extrude(3)difference(){
    minkowski() {
        base_mask();
        circle(r=2);
    }
    base_mask();
}
linear_extrude(2)base_hole_shrink();

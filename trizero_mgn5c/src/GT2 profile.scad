$fn=120;

module gt2_profile(angles, tolerance = 0) {
    P = 2;
    R1 = 0.15;
    R2 = 1;
    R3 = 0.555;
    b = 0.4;
    H = 1.38;
    h = 0.75;
    PLD = 0.254;
    epsilon = 0.001;

    corner_ease_dx = sqrt((R1 + R2)^2 - R1^2);
    corner_easy_dy = R1 / (R1 + R2);

    translate([b-corner_ease_dx - epsilon, -tolerance])square([(corner_ease_dx - b + epsilon) * 2, H-h + tolerance]);
    translate([0, H - R3])circle(r=R3);

    translate([b, H - h])intersection() {
        circle(r=R2);
        polygon([
            [-R2, R2 * (h - R3) / b],
            [-R2, -epsilon],
            [0, 0],
        ]);
    }
    translate([b - corner_ease_dx, H - h + R1]) difference() {
        translate([0, -R1 - epsilon])square([R1, epsilon + corner_easy_dy]);
        circle(r=R1);
    }

    mirror([1,0]) {
        translate([b, H - h])intersection() {
            circle(r=R2);
            polygon([
                [-R2, R2 * (h - R3) / b],
                [-R2, -epsilon],
                [0, 0],
            ]);
        }
        translate([b - corner_ease_dx, H - h + R1]) difference() {
            translate([0, -R1 - epsilon])square([R1, epsilon + corner_easy_dy]);
            circle(r=R1);
        }
    }
    
    if (len(angles)) {
        turn_length = P - (corner_ease_dx - b) * 2;
        if (angles[0] == 0) {
            translate([corner_ease_dx - b, -tolerance])square([turn_length, H-h+tolerance]);
            translate([P, 0]) if (len(angles) > 1) {
                gt2_profile([for(i=1;i<len(angles);i=i+1)angles[i]], tolerance);
            }
        } else if (angles[0] > 0) {
            theta = angles[0] * PI / 180;
            radius_at_pld = turn_length / theta;
            center = [corner_ease_dx - b, H - h - PLD + radius_at_pld];
            translate(center)intersection(){
                R = H - h - PLD + radius_at_pld + tolerance;
                r = radius_at_pld - PLD;
                difference() {
                    circle(r=R);
                    circle(r=r);
                }
                if (len(angles) > 1) {
                    polygon([
                        [0, 0],
                        [0, -R],
                        [tan(angles[0]) * R, -R],
                    ]);
                } else {
                    polygon([
                        [0, 0],
                        [0, -R],
                        [tan(angles[0] / 2) * R, -R],
                    ]);
                }
            }
            if(len(angles) > 1)translate(center)rotate(angles[0])translate(-center)translate([(corner_ease_dx - b) * 2, 0]) {
                gt2_profile([for(i=1;i<len(angles);i=i+1)angles[i]], tolerance);
            }
        } else {
            // Unimplemented
        }
    }
}

gt2_profile([36, 36, 36, 36, 36, 36], 0.2);


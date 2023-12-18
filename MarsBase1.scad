
module dome(size) {
    difference() {
	sphere(size);
    translate([-1*size, -1*size, -2*size]) cube([2*size, 2*size, 2*size]);
    }
}

module airlock(diameter = 0, radius = 0, length) {
    
    if(diameter > 0) {
        rotate([90, 0, 0])cylinder(h = length, d = diameter, $fn = 8);
        translate([0, 0, 0.2 * diameter]) rotate([90, 0, 0]){
            rotate_extrude(convexity = 10){
                    translate([4, 0, 0]) circle(d = 0.08*diameter, $fn = 100);
            }
        }
    }
    
    if(radius > 0) {
        rotate([90, 0, 0])cylinder(h = length, d = diameter, $fn = 8);
        rotate([90, 0, 0]){
            rotate_extrude(convexity = 10){
                translate([5, 0, 0]) circle(r = 0.1*radius, $fn = 100);
            }
        }
    }
}


module hab(size){
    dome(size);
    difference(){
        translate([0, size * 1.01, 5]) airlock(diameter = 30, length = 50);
        translate([-1*size, 0, -2*size]) cube([2*size, 2*size, 2*size]);
    }
}
hab(100);
rotate([0, 0, 120]) hab(100);
rotate([0, 0, 240]) hab(100);

module rover() {
    
}
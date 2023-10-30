Pipe();

module Pipe(length = 250, sideHole = 40) {
    od = 48.26;
    id = 40.894;
    baseThickness = 5;

    sideHoleZ = -1 * ((length / 2) - sideHole );

    difference() {
        cylinder(d=od, h=length, center=true);
        cylinder(d=id, h=length+1, center=true);
        translate([0, 0, sideHoleZ])
            rotate([0, 90, 0])
                cylinder(d=sideHole, h=40, center=false);
    };

    translate([0, 0, sideHoleZ-(baseThickness*2)])
        intersection() {
            rotate([0, 45, 0])
                cube([od*2, od*2, baseThickness], true);
            cylinder(d=od, h=length, center=true);
        }
}

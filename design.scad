Pipe(length=300);

module Pipe(length = 250, $fn = 100) {
    od = 48.26;
    id = 40.894;
    baseThickness = 5;
    topBarHeight = 10;
    topBarWidth = 1.5;

    sideHoleZ = -1 * ((length / 2) - id);

    difference() {
        cylinder(d=od, h=length, center=true);
        cylinder(d=id, h=length+1, center=true);
        translate([0, od/2, sideHoleZ])
            rotate([90, 0, 0])
                scale([1.2,1])
                    cylinder(d2=od*1.25, d1=0, h=od, center=false);

        translate([0, 0, (length/2)-((topBarHeight-1)/2)])
            cube([od+1, topBarWidth, topBarHeight+1], center=true);
    };

    translate([0, 0, sideHoleZ-(baseThickness*2.5)])
        intersection() {
            rotate([45, 0, 0])
                cube([od*2, od*2, baseThickness], true);
            cylinder(d=od, h=length, center=true);
        }
}

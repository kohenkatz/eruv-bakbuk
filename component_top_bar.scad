include <BOSL2/std.scad>;
use <pipe_defs.scad>;

module TopBarCutout(pipeLength, pipeDiam, topBarHeight = 10, topBarWidth = .75) {
    od = getPipeODSched40(pipeDiam);

    translate([0, 0, (pipeLength/2)-((topBarHeight-1)/2)])
        TopBar(forCutout=true);
}

module TopBar(topBarHeight = 10, topBarWidth = 1, pipeDiam = 2, wings = true,forCutout = false, $fn = 100) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);

    if (forCutout) {
        cube([od+1, topBarWidth, topBarHeight+1], center=true);
    } else {
        difference() {
            cube([od, topBarWidth, topBarHeight], center=true);
            rotate([90,0,0])
                cylinder(h=topBarWidth+1, d=2, center=true);
        }
    }

    if (wings) {
        intersection() {
            cube([od+1, 10, topBarHeight], center = true);
            Sched40PipeOuterPart(topBarHeight, pipeDiam, forCutout, .5);
        }
    }
}

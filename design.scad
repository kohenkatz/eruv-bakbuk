include <pipe_defs.scad>;

Pipe();

module Pipe(length = 210, pipeDiam = 2, $fn = 100) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);
    
    baseThickness = 5;

    difference() {
        Sched40Pipe(length, pipeDiam);

        PipeSideHole(length, pipeDiam, baseThickness * 4);

        TopBarCutout(length, pipeDiam);
    };

    MirrorBase(length, pipeDiam, baseThickness);
}

module PipeSideHole(pipeLength, pipeDiam, bottomOffset) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);
    holeDiam = od;
    holeDepth = id + ((od-id)/2);
    // Don't let the hole weaken the opposite side of the pipe
    sideHoleOffsetY = (id/2);

    pipeBottom = -1 * (pipeLength / 2);
    sideHoleZ = pipeBottom + (holeDiam/2) + bottomOffset;

    translate([0, sideHoleOffsetY, sideHoleZ])
            rotate([90, 0, 0])
                scale([1.5,1.2])
                    cylinder(d2=od, d1=0, h=holeDepth, center=false);
}

module TopBarCutout(pipeLength, pipeDiam, topBarHeight = 10, topBarWidth = .75) {
    od = getPipeODSched40(pipeDiam);

    translate([0, 0, (pipeLength/2)-((topBarHeight-1)/2)])
            cube([od+1, topBarWidth, topBarHeight+1], center=true);
}

module MirrorBase(pipeLength, pipeDiam, baseThickness) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);
    holeDiam = od;
    pipeBottom = -1 * (pipeLength / 2);
    mirrorBaseZ = pipeBottom + (holeDiam/2) + baseThickness;

    translate([0, 0, mirrorBaseZ])
        intersection() {
            rotate([45, 0, 0])
                cube([od*2, od*2, baseThickness], true);
            cylinder(d=od, h=pipeLength, center=true);
        }
}

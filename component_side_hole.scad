include <BOSL2/std.scad>;
use <pipe_defs.scad>;

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

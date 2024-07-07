include <BOSL2/std.scad>;
use <pipe_defs.scad>;

module MirrorBase(pipeLength, pipeDiam, baseThickness, angle = 35) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);
    holeDiam = od;
    pipeBottom = -1 * (pipeLength / 2);
    mirrorBaseZ = pipeBottom + (holeDiam/2);

    translate([0, 0, mirrorBaseZ])
        difference() {
            intersection() {
                rotate([angle, 0, 0])
                    cube([od*2, od*2, baseThickness], true);
                cylinder(d=od, h=pipeLength, center=true);
            }
            translate([0, 0, 3])
                rotate([angle, 0, 0])
                    cylinder(d=id, h=2, center=true);
        }
}

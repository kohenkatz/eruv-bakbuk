include <BOSL2/std.scad>;
use <component_side_hole.scad>;
use <component_mirror_base.scad>;
use <component_top_bar.scad>;
use <pipe_defs.scad>;

module Pipe(length = 210, pipeDiam = 2, $fn = 100, isTop = true, isBottom = true) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);

    baseThickness = 5;

    difference() {
        Sched40Pipe(length, pipeDiam);

        if (isTop) {
            TopBarCutout(length, pipeDiam);
        }

        if (isBottom) {
            PipeSideHole(length, pipeDiam, baseThickness * 4);
        }
    };

    if (isBottom) {
        MirrorBase(length, pipeDiam, baseThickness);
    }
}

include <BOSL2/std.scad>;
include <text_content.scad>;
use <component_pipe.scad>;
use <component_top_bar.scad>;
use <text_helper.scad>;
use <pipe_defs.scad>;

// This file provides a full-sized "pipe",
// including the mirror base and the credit text.

FullPipe();

module FullPipe(length = 210, pipeDiam = 2, $fn = 100) {
    od = getPipeODSched40(pipeDiam);

    Pipe(length = length, pipeDiam = pipeDiam, $fn = $fn);

    up(40)
    multi_text_on_cylinder(text1, 3, od, offsetlines=3);

    up(40)
    multi_text_on_cylinder(text2, 3, od, offsetlines=-2);
}

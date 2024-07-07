include <BOSL2/std.scad>;
include <BOSL2/threading.scad>;
include <text_content.scad>;
use <component_pipe.scad>;
use <component_top_bar.scad>;
use <text_helper.scad>;
use <pipe_defs.scad>;

// This file provides the top half of the pipe,
// including the credit text.
// Use this file for printers that do not reach the required
// Z-height for the entire print.

HalfPipeTop();

module HalfPipeTop(length = 105, pipeDiam = 2, $fn = 100) {
    od = getPipeODSched40(pipeDiam);

    difference() {
        Pipe(length = length, pipeDiam = pipeDiam, $fn = $fn, isBottom = false);

        down(length/2)
        npt_threaded_rod(
            orient = DOWN,
            size = pipeDiam,
            internal = true
        );
    }

    multi_text_on_cylinder(text1, 3, od, offsetlines=3);

    multi_text_on_cylinder(text2, 3, od, offsetlines=-2);
}

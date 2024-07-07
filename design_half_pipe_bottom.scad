include <BOSL2/std.scad>;
include <BOSL2/threading.scad>;
use <component_pipe.scad>;

// This file provides the top half of the pipe,
// including the mirror base.
// Use this file for printers that do not reach the required
// Z-height for the entire print.

HalfPipeBottom();

module HalfPipeBottom(length = 105, pipeDiam = 2, $fn = 100) {
    Pipe(length = length, pipeDiam = pipeDiam, $fn = $fn, isTop = false);
        
    up(length/2)
    npt_threaded_rod(
        size = pipeDiam,
        hollow = true
    );
}

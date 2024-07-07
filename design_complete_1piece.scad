include <BOSL2/std.scad>;
use <design_full_pipe.scad>;
use <component_top_bar.scad>;

// This file provides a preview of the complete
// "Bakbuk" project, including a full-size tube
// and the top bar that slots into it.
// This file is probably not suitable for printing,
// only for display.

FullPipe();

up(120)
TopBar(wings=true);

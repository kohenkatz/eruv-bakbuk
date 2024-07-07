include <BOSL2/std.scad>;
use <design_half_pipe_bottom.scad>;
use <design_half_pipe_top.scad>;
use <component_top_bar.scad>;

// This file provides a preview of the complete
// "Bakbuk" project, including a two-part tube that
// will be glued together and the top bar that slots into it.
// This file is probably not suitable for printing,
// only for display.

down(60)
HalfPipeBottom();

up(60)
HalfPipeTop();

up(130)
TopBar(wings=true);

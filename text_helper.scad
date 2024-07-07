include <BOSL2/std.scad>;
include <text_on/text_on.scad>;

module multi_text_on_cylinder(lines, size, od, offsetlines = 0) {
    lineheight = size * 4;
    starteast = offsetlines != 0 ? (offsetlines * lineheight) : ((((len(lines)+1) / 2)-1) * lineheight);

    union() {
        for (i = [0 : len(lines)-1])
            text_on_cylinder(
                lines[i],
                locn_vec=[0,0,0],
                r=(od/2),
                h=40,
                rotate=90,
                eastwest=starteast-(lineheight*i),
                cylinder_center=true,
                font="Bahnschrift:style=SemiCondensed",
                size=size
            );
    }
}

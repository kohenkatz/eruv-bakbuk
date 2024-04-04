include <BOSL2/std.scad>;
include <text_on/text_on.scad>;
include <pipe_defs.scad>;

Pipe();

//up(120)
//TopBar(wings=true);

module Pipe(length = 210, pipeDiam = 2, $fn = 100) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);

    baseThickness = 5;
    
    text1 = ([
        "Designed and produced",
        "by Rabbi Micah Shotkin",
        "and Dr. Moshe Katz",
    ]);
    text2 = ([
        "Rabbi Micah Shotkin",
        "Eruv design, construction, and repair",
        "(973) 330-6355 / shotkin@gmail.com"
    ]);

    difference() {
        Sched40Pipe(length, pipeDiam);

        PipeSideHole(length, pipeDiam, baseThickness * 4);

        TopBarCutout(length, pipeDiam);
        
        up(40)
        multi_text_on_cylinder(text1, 3, od, offsetlines=3);
        
        up(40)
        multi_text_on_cylinder(text2, 3, od, offsetlines=-2);
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
        TopBar(forCutout=true);
}

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

module TopBar(topBarHeight = 10, topBarWidth = 1, pipeDiam = 2, wings = true,forCutout = false, $fn = 100) {
    od = getPipeODSched40(pipeDiam);
    id = getPipeIDSched40(pipeDiam);

    if (forCutout) {
        cube([od+1, topBarWidth, topBarHeight+1], center=true);
    } else {
        difference() {
            cube([od, topBarWidth, topBarHeight], center=true);
            rotate([90,0,0])
                cylinder(h=topBarWidth+1, d=2, center=true);
        }
    }

    if (wings) {
        intersection() {
            cube([od+1, 10, topBarHeight], center = true);
            Sched40PipeOuterPart(topBarHeight, pipeDiam, forCutout, .5);
        }
    }
}

module multi_text_on_cylinder(lines, size, od, offsetlines = 0) {
    lineheight = size * 4;
    starteast = offsetlines != 0 ? (offsetlines * lineheight) : ((((len(lines)+1) / 2)-1) * lineheight);

    union() {
        for (i = [0 : len(lines)-1])
          text_on_cylinder(lines[i],locn_vec=[0,0,0],r=(od/2),h=40,rotate=90, eastwest=starteast-(lineheight*i),cylinder_center=true,font="Bahnschrift:style=SemiCondensed", size=size);
    }
}

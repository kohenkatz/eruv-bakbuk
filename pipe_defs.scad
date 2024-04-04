include <BOSL2/std.scad>;

function getPipeODSched40(inches) = lookup(inches, [
    [1   , 33.4 ],
    [1.25, 42.16],
    [1.5 , 48.26],
    [2   , 60.33],
    [2.5 , 73.03],
    [3   , 88.9 ],
    [3.5 , 101.6],
    [4   , 114.3],
]);

function getPipeIDSched40(inches) = lookup(inches, [
    [1   , 26.14],
    [1.25, 34.54],
    [1.5 , 40.39],
    [2   , 51.99],
    [2.5 , 62.1 ],
    [3   , 77.27],
    [3.5 , 89.43],
    [4   , 101.55],
]);

module Sched40Pipe(length, d) {
    od = getPipeODSched40(d);
    id = getPipeIDSched40(d);
 
    tube(h=length, od=od, id=id);
}

module Sched40PipeOuterPart(length, d, forCutout = false, thickness = 0.5) {
    od = getPipeODSched40(d);
    id = getPipeIDSched40(d);
    wallThickness = (od-id) * thickness;
 
    difference() {
        if (forCutout) {
            cylinder(d=od+1, h=length+1, center=true);
        } else {
            cylinder(d=od, h=length, center=true);
        }
        cylinder(d=od-wallThickness, h=length+1, center=true);
    };
}
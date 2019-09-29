$fn = 64;

module HallowCircle(radius, xyThickness)
{
    difference()
    {
        circle(radius);
        circle(radius - xyThickness);
    }
}

module Circles(
    numberCircles = 10,
    minPos = -15,
    maxPos = 15,
    radius = 5,
    xyThickness = 1,
    zThickness = 1)
{
    linear_extrude(zThickness)
    for (idx = [0 : 1 : numberCircles - 1])
    {
        pos = rands(minPos, maxPos, 2);
        translate(pos)
        HallowCircle(radius, xyThickness);
    }
}

Circles();

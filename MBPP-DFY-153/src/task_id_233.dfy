method CylinderLateralSurfaceArea(radius: real, height: real) returns (area: real)
    requires radius > 0.0 && height > 0.0
    ensures area == 2.0 * (radius * height) * 3.14
{
    area := 2.0 * (radius * height) * 3.14;
}
method CircleCircumference(radius: real) returns (circumference: real)
    requires radius > 0.0
    ensures circumference == 2.0 * 3.14159265358979323846 * radius
{
    circumference := 2.0 * 3.14159265358979323846 * radius;
}
method RectangleArea(width: int, height: int) returns (area: int)
    requires width >= 0
    requires height >= 0
    ensures area == width * height
{
    area := width * height;
}

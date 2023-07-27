method Min(a: int, b: int) returns (minValue: int)
    ensures minValue == a || minValue == b
    ensures minValue <= a && minValue <= b
{
}

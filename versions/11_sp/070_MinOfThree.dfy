method MinOfThree(a: int, b: int, c: int) returns (min: int)
{
    if (a <= b && a <= c) {
        min := a;
    } else if (b <= a && b <= c) {
        min := b;
    } else {
        min := c;
    }
}

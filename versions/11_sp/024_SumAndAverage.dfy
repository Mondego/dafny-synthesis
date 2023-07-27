method SumAndAverage(n: int) returns (sum: int, average: real)
{
    sum := 0;
    for i := 1 to n + 1
    invariant 0 <= i <= n + 1
    invariant sum == (i - 1) * i / 2
    {
        sum := sum + i;
    }
    average := sum as real / n as real;
}

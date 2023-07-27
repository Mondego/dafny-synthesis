method SumAndAverage(n: int) returns (sum: int, average: real)
{
    sum := 0;
    for i := 1 to n + 1
    {
        sum := sum + i;
    }
    average := sum as real / n as real;
}

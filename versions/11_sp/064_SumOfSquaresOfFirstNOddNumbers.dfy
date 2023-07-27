method SumOfSquaresOfFirstNOddNumbers(n: int) returns (sum: int)
{
    sum := 0;
    var i := 1;
    for k:=0 to n
        invariant 0 <= k <= n
        invariant sum == k * (2 * k - 1) * (2 * k + 1) / 3
        invariant i == 2 * k + 1
    {
        sum := sum + i * i;
        i := i + 2;
    }
}

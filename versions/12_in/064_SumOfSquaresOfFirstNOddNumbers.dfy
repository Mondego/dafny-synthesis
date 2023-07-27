method SumOfSquaresOfFirstNOddNumbers(n: int) returns (sum: int)
    requires n >= 0
    ensures sum == (n * (2 * n - 1) * (2 * n + 1)) / 3
{
    sum := 0;
    var i := 1;
    for k:=0 to n
    {
        sum := sum + i * i;
        i := i + 2;
    }
}

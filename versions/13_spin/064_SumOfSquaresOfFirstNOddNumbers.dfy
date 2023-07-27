method SumOfSquaresOfFirstNOddNumbers(n: int) returns (sum: int)
{
    sum := 0;
    var i := 1;
    for k:=0 to n
    {
        sum := sum + i * i;
        i := i + 2;
    }
}

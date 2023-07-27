predicate IsOdd(n: int)
{
    n % 2 == 1
}

method IsOddAtIndexOdd(a: array<int>) returns (result: bool)
{
    result := true;
    for i := 0 to a.Length
    {
        if IsOdd(i) && !IsOdd(a[i])
        {
            result := false;
            break;
        }
    }
}

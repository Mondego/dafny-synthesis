predicate IsOdd(n: int)
{
    n % 2 == 1
}

method IsOddAtIndexOdd(a: array<int>) returns (result: bool)
    ensures result <==> forall i :: 0 <= i < a.Length ==> (IsOdd(i) ==> IsOdd(a[i]))
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

predicate IsEven(n: int)
{
    n % 2 == 0
}

method IsProductEven(a: array<int>) returns (result: bool)
    ensures result <==> exists i :: 0 <= i < a.Length && IsEven(a[i])
{
    result := false;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant result <==> exists k :: 0 <= k < i && IsEven(a[k])
    {
        if IsEven(a[i])
        {
            result := true;
            break;
        }
    }
}
predicate InArray(a: array<int>, x: int)
{
    exists i :: 0 <= i < a.Length && a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
{
    var res: seq<int> := [];
    for i := 0 to a.Length
    {
        if !InArray(b, a[i]) && a[i] !in res
        {
            res := res + [a[i]];
        }
    }

    ghost var partialSize := |res|;
    for i := 0 to b.Length
    {
        if !InArray(a, b[i]) && b[i] !in res
        {
            res := res + [b[i]];
        }
    }

    result := res;
}

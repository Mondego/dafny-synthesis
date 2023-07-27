predicate InArray(a: array<int>, x: int)
{
    exists i :: 0 <= i < a.Length && a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
{
    var res: seq<int> := [];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant forall x :: x in res ==> InArray(a, x)
        invariant forall x :: x in res ==> InArray(a, x) != InArray(b, x) 
        invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
    {
        if !InArray(b, a[i]) && a[i] !in res
        {
            res := res + [a[i]];
        }
    }

    ghost var partialSize := |res|;
    for i := 0 to b.Length
        invariant 0 <= i <= b.Length
        invariant forall k :: partialSize <= k < |res| ==> InArray(b, res[k])
        invariant forall k :: 0 <= k < |res| ==> InArray(a, res[k]) != InArray(b, res[k]) 
        invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
    {
        if !InArray(a, b[i]) && b[i] !in res
        {
            res := res + [b[i]];
        }
    }

    result := res;
}

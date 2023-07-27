predicate InArray(a: array<int>, x: int)
    reads a
{
    exists i :: 0 <= i < a.Length && a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
    // All elements in the output are either in a or b, but not in both or neither
    ensures forall x :: x in result ==> (InArray(a, x) != InArray(b, x))
    // The elements in the output are all different
    ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
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

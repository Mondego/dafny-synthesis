predicate InArray(a: array<int>, x: int)
    reads a
{
    exists i :: 0 <= i < a.Length && a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
    // All elements in the output are either in a or b, but not in both or neither
    ensures forall x :: x in result ==> (InArray(a, x) != InArray(b, x))
    // For all a and b elements, if they are in one but not the other, then they are in the output
    ensures forall x :: x in a[..] + b[..] ==> ((InArray(a, x) != InArray(b, x)) ==> x in result)
    // The elements in the output are all different
    ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
    var res: seq<int> := [];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant forall x :: x in res ==> InArray(a, x)
        invariant forall j :: 0 <= j < i && InArray(a, a[j]) != InArray(b, a[j]) ==> a[j] in res
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
        invariant forall j :: 0 <= j < i && InArray(a, b[j]) != InArray(b, b[j]) ==> b[j] in res
        invariant forall x :: x in a[..] + b[..i] ==> ((InArray(a, x) != InArray(b, x)) ==> x in res)
        invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
    {
        if !InArray(a, b[i]) && b[i] !in res
        {
            res := res + [b[i]];
        }
    }

    result := res;
}
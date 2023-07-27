method HasCommonElement(a: array<int>, b: array<int>) returns (result: bool)
{
    result := false;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant !result ==> forall k, j :: 0 <= k < i && 0 <= j < b.Length ==> a[k] != b[j]
    {
        for j := 0 to b.Length
            invariant 0 <= j <= b.Length
            invariant !result ==> forall k :: 0 <= k < j ==> a[i] != b[k]
        {
            if a[i] == b[j] {
                result := true;
                return;
            }
        }
    }
}

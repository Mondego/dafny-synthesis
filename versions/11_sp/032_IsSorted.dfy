method IsSorted(a: array<int>) returns (sorted: bool)
{
    sorted := true;
    for i := 0 to a.Length - 1
        invariant 0 <= i < a.Length
        invariant sorted <== forall k, l :: 0 <= k < l < i ==> a[k] <= a[l]
        invariant !sorted ==> exists k :: 0 <= k < i && a[k] > a[k+1]
    {
        if a[i] > a[i + 1]
        {
            sorted := false;
            break;
        }
    }
    sorted := sorted;
}

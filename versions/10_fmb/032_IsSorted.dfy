method IsSorted(a: array<int>) returns (sorted: bool)
    requires a.Length > 0
    ensures sorted <== forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
    ensures !sorted ==> exists i, j :: 0 <= i < j < a.Length && a[i] > a[j]
{
}

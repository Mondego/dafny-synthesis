method FindMedian(a: array<int>, b: array<int>) returns (median: int)
    requires a != null && b != null
    requires a.Length == b.Length
    requires a.Length > 0
    requires forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
    requires forall i :: 0 <= i < b.Length - 1 ==> b[i] <= b[i + 1]
    ensures median == if (a.Length % 2 == 0) then (a[a.Length / 2 - 1] + b[0]) / 2 else a[a.Length / 2]
{
    if (a.Length % 2 == 0) {
        median := (a[a.Length / 2 - 1] + b[0]) / 2;
    } else {
        median := a[a.Length / 2];
    }
}
method IsMinHeap(a: array<int>) returns (result: bool)
    requires a != null
    ensures result ==> forall i :: 0 <= i < a.Length / 2 ==> a[i] <= a[2*i + 1] && (2*i + 2 == a.Length || a[i] <= a[2*i + 2])
    ensures !result ==> exists i :: 0 <= i < a.Length / 2 && (a[i] > a[2*i + 1] || (2*i + 2 != a.Length && a[i] > a[2*i + 2]))
{
    result := true;
    for i := 0 to a.Length / 2
        invariant 0 <= i <= a.Length / 2
        invariant result ==> forall k :: 0 <= k < i ==> a[k] <= a[2*k + 1] && (2*k + 2 == a.Length || a[k] <= a[2*k + 2])
    {
        if a[i] > a[2*i + 1] || (2*i + 2 != a.Length && a[i] > a[2*i + 2]) {
            result := false;
            break;
        }
    }
}
method AllElementsEqual(a: array<int>, n: int) returns (result: bool)
    requires a != null
    ensures result ==> forall i :: 0 <= i < a.Length ==> a[i] == n
    ensures !result ==> exists i :: 0 <= i < a.Length && a[i] != n
{
    result := true;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant result ==> forall k :: 0 <= k < i ==> a[k] == n
    {
        if a[i] != n {
            result := false;
            break;
        }
    }
}
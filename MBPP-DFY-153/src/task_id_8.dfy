method SquareElements(a: array<int>) returns (squared: array<int>)
    ensures squared.Length == a.Length
    ensures forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
{
    squared := new int[a.Length];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant squared.Length == a.Length
        invariant forall k :: 0 <= k < i ==> squared[k] == a[k] * a[k]
    {
        squared[i] := a[i] * a[i];
    }
}
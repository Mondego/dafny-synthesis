method PairwiseAddition(a: array<int>) returns (result: array<int>)
    requires a != null
    requires a.Length % 2 == 0
    ensures result != null
    ensures result.Length == a.Length / 2
    ensures forall i :: 0 <= i < result.Length ==> result[i] == a[2*i] + a[2*i + 1]
{
    result := new int[a.Length / 2];
    var i := 0;
    while i < a.Length / 2
        invariant 0 <= i <= a.Length / 2
        invariant result.Length == a.Length / 2
        invariant forall k :: 0 <= k < i ==> result[k] == a[2*k] + a[2*k + 1]
    {
        result[i] := a[2*i] + a[2*i + 1];
        i := i + 1;
    }
}
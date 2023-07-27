method ElementWiseModulo(a: array<int>, b: array<int>) returns (result: array<int>)
{
    result := new int[a.Length];
    var i := 0;
    while i < a.Length
        invariant 0 <= i <= a.Length
        invariant result.Length == a.Length
        invariant forall k :: 0 <= k < i ==> result[k] == a[k] % b[k]
    {
        result[i] := a[i] % b[i];
        i := i + 1;
    }
}

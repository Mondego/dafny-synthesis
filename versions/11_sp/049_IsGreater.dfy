method IsGreater(n: int, a: array<int>) returns (result: bool)
{
    result := true;
    var i := 0;
    while i < a.Length
        invariant 0 <= i <= a.Length
        invariant result ==> forall k :: 0 <= k < i ==> n > a[k]
        invariant !result ==> exists k :: 0 <= k < i && n <= a[k]
    {
        if n <= a[i] {
            result := false;
            break;
        }
        i := i + 1;
    }
}

method IsPerfectSquare(n: int) returns (result: bool)
    requires n >= 0
    ensures result == true ==> (exists i: int :: 0 <= i <= n && i * i == n)
    ensures result == false ==> (forall a: int :: 0 < a*a < n ==> a*a != n)
{
    var i := 0;
    while (i * i < n)
        invariant 0 <= i <= n
        invariant forall k :: 0 <= k < i ==> k * k < n
    {
        i := i + 1;
    }
    return i * i == n;
}
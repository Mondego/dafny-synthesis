/*
method IsPerfectSquare(n: int) returns (result: bool)
    requires n > 0
    ensures result == true  ==> (exists a: int :: a > 0 && a*a == n)
    ensures result == false ==> (forall a: int :: 0 < a*a < n ==> a*a != n)
{
    var i := 1;
    while (i*i < n)
    {
        i := i + 1;
    }
    assert(i*i >= n);
    assert((i+1)*(i+1) > n);
    return (i*i == n);
}
*/

method IsPerfectSquare(n: int) returns (result: bool)
    requires n >= 0
    ensures result == true ==> (exists i: int :: 0 <= i <= n && i * i == n)
    ensures result == false ==> (forall a: int :: 0 < a*a < n ==> a*a != n)
{
    var i := 0;
    while (i * i < n)
    {
        i := i + 1;
    }
    return i * i == n;
}

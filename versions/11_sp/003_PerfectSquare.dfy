/*
method IsPerfectSquare(n: int) returns (result: bool)
{
    var i := 1;
    while (i*i < n)
        invariant i*i < n ||  (i+1)*(i+1) > n
    {
        i := i + 1;
    }
    assert(i*i >= n);
    assert((i+1)*(i+1) > n);
    return (i*i == n);
}
*/

method IsPerfectSquare(n: int) returns (result: bool)
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

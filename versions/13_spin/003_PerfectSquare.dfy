/*
method IsPerfectSquare(n: int) returns (result: bool)
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
{
    var i := 0;
    while (i * i < n)
    {
        i := i + 1;
    }
    return i * i == n;
}

ghost predicate IsPerfectSquare(n: int)
{
    exists k : int :: 0 <= k && k * k == n
}

method PerfectSquaresInRange(start: int, end: int) returns (squares: seq<int>)
{
    squares := [];
    var i := 0;
    while (i * i <= end)
    {
        if (i * i >= start) {
            squares := squares + [i * i];
        }
        i := i + 1;
    }
}


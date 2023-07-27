ghost predicate IsPerfectSquare(n: int)
{
    exists k : int :: 0 <= k && k * k == n
}

method PerfectSquaresInRange(start: int, end: int) returns (squares: seq<int>)
{
    squares := [];
    var i := 0;
    while (i * i <= end)
        invariant i == 0 || 0 <= (i-1)*(i-1) <= end 
        invariant 0 <= |squares| <= i
        invariant forall k :: 0 <= k < |squares| ==> IsPerfectSquare(squares[k])
        invariant forall r, n :: 0 <= r < i && n == r*r && start <= n <= end && IsPerfectSquare(n) ==> n in squares
        invariant forall k :: 0 <= k < |squares| ==> squares[k] < i*i
        invariant forall k :: 0 <= k < |squares| - 1 ==> squares[k] < squares[k + 1]
    {
        if (i * i >= start) {
            squares := squares + [i * i];
        }
        i := i + 1;
    }
}


// ghost predicates can use quantifers
ghost predicate IsPerfectSquare(n: int)
{
    exists k : int :: 0 <= k && k * k == n
}

method PerfectSquaresInRange(start: int, end: int) returns (squares: seq<int>)
    requires 0 <= start <= end
    // All elements in the output are perfect squares
    ensures forall i :: 0 <= i < |squares| ==> IsPerfectSquare(squares[i])
    // All perfect squares in the given range are in the output
    ensures forall r, n :: 0 <= r < |squares| && n == r*r && start <= n <= end && IsPerfectSquare(n) ==> n in squares
    // The elements in the output are sorted by ascending order
    ensures forall i :: 0 <= i < |squares| - 1 ==> squares[i] < squares[i + 1]
{
    squares := [];
    var i := 0;
    while (i * i <= end)
        // All elements in the current output are perfect squares
        // All perfect squares in the given range are in the current output
        // The elements in the current output are sorted by ascending order
    {
        if (i * i >= start) {
            squares := squares + [i * i];
        }
        i := i + 1;
    }
}


// ghost predicates can use quantifers
ghost predicate IsPerfectSquare(n: int)
    requires n >= 0
{
    exists k : int :: 0 <= k && k * k == n
}

method PerfectSquaresInRange(start: int, end: int) returns (squares: seq<int>)
    requires 0 <= start <= end
    // All elements in the output are >= 0
    ensures forall k :: 0 <= k < |squares| ==> squares[k] >= 0
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
        invariant i == 0 || 0 <= (i-1)*(i-1) <= end 
        invariant 0 <= |squares| <= i
        // All elements in the current output are >= 0
        invariant forall k :: 0 <= k < |squares| ==> squares[k] >= 0
        // All elements in the current output are perfect squares
        invariant forall k :: 0 <= k < |squares| ==> IsPerfectSquare(squares[k])
        // All perfect squares in the given range are in the current output
        invariant forall r, n :: 0 <= r < i && n == r*r && start <= n <= end && IsPerfectSquare(n) ==> n in squares
        // The elements in the current output are sorted by ascending order
        invariant forall k :: 0 <= k < |squares| ==> squares[k] < i*i
        invariant forall k :: 0 <= k < |squares| - 1 ==> squares[k] < squares[k + 1]
    {
        if (i * i >= start) {
            squares := squares + [i * i];
        }
        i := i + 1;
    }
}


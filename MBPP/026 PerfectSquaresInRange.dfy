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
    // The elements in the output are sorted by ascending order
//    ensures forall i :: 0 <= i < |squares| - 1 ==> squares[i] < squares[i + 1]
    // All perfect squares in the given range are in the output
    ensures forall r, n :: 0 <= r < |squares| && n == r*r && start <= n <= end && IsPerfectSquare(n) ==> n in squares
{
    var result: seq<int> := [];
    var i := 0;
    while (i * i <= end)
        invariant i == 0 || 0 <= (i-1)*(i-1) <= end 
        invariant 0 <= |result| <= i
        invariant forall k :: 0 <= k < |result| ==> result[k] >= 0
        invariant forall k :: 0 <= k < |result| ==> IsPerfectSquare(result[k])
        invariant forall n :: start <= n <= |result| && !IsPerfectSquare(n) ==> n !in result
        invariant forall r, n :: 0 <= r < i && n == r*r && start <= n <= end && IsPerfectSquare(n) ==> n in result
    {
        if (i * i >= start) {
            result := result + [i * i];
            assert i*i == start && IsPerfectSquare(i*i) ==> i*i in result;
        }
        i := i + 1;
    }
    assert i*i == end && IsPerfectSquare(i*i) ==> i*i in result;
    squares := result;
}

/*
method PerfectSquaresInRange(start: int, end: int) returns (squares: seq<int>)
    requires 0 <= start <= end
    // All elements in the output are >= 0
    ensures forall k :: 0 <= k < |squares| ==> squares[k] >= 0
    // All elements in the output are perfect squares
    ensures forall i :: 0 <= i < |squares| ==> exists r :: 0 <= r && r*r == squares[i] // IsPerfectSquare(squares[i])
    // The elements in the output are sorted by ascending order
    ensures forall i :: 0 <= i < |squares| - 1 ==> squares[i] < squares[i + 1]
    // All perfect squares in the given range are in the output
    ensures forall n, r :: start <= n <= end && 0 <= r && r*r == n ==> n in squares
{
    var result: seq<int> := [];
    var i := 0;
    while (i * i <= end)
        invariant 0 <= i
        invariant forall k :: 0 <= k < |result| ==> result[k] >= 0
        invariant forall k :: 0 <= k < |result| ==> exists r :: 0 <= r && r*r == result[k] // IsPerfectSquare(result[k])
//        invariant forall k :: 0 <= k < |result| - 1 ==> result[k] < result[k + 1]
        invariant forall ii :: 0 < ii <= i/ii && start < (ii-1)*(ii-1) < end ==> (ii-1)*(ii-1) in result
//        invariant forall n :: start <= n <= end && i*i == n ==> n in result
    {
        if (i * i >= start) {
            result := result + [i * i];
        }
        i := i + 1;
    }
    return result;
}

*/

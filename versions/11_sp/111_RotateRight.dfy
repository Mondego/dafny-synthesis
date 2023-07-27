method RotateRight(l: seq<int>, n: int) returns (r: seq<int>)
{
    var rotated: seq<int> := [];
    for i := 0 to |l|
        invariant 0 <= i <= |l|
        invariant |rotated| == i
        invariant forall k :: 0 <= k < i ==> rotated[k] == l[(k - n + |l|) % |l|]
    {
        rotated := rotated + [l[(i - n + |l|) % |l|]];
    }
    return rotated;
}

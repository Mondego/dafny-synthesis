method RotateRight(l: seq<int>, n: int) returns (r: seq<int>)
    requires n >= 0
    ensures |r| == |l|
    ensures forall i :: 0 <= i < |l| ==> r[i] == l[(i - n + |l|) % |l|]
{
    var rotated: seq<int> := [];
    for i := 0 to |l|
    {
        rotated := rotated + [l[(i - n + |l|) % |l|]];
    }
    return rotated;
}

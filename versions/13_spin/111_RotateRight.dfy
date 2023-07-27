method RotateRight(l: seq<int>, n: int) returns (r: seq<int>)
{
    var rotated: seq<int> := [];
    for i := 0 to |l|
    {
        rotated := rotated + [l[(i - n + |l|) % |l|]];
    }
    return rotated;
}

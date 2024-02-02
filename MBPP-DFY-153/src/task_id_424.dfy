method ExtractRearChars(l: seq<string>) returns (r: seq<char>)
    requires forall i :: 0 <= i < |l| ==> |l[i]| > 0
    ensures |r| == |l|
    ensures forall i :: 0 <= i < |l| ==> r[i] == l[i][|l[i]| - 1]
{
    var rearChars: seq<char> := [];
    for i := 0 to |l|
        invariant 0 <= i <= |l|
        invariant |rearChars| == i
        invariant forall k :: 0 <= k < i ==> rearChars[k] == l[k][|l[k]| - 1]
    {
        rearChars := rearChars + [l[i][|l[i]| - 1]];
    }
    return rearChars;
}
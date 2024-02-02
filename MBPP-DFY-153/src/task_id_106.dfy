method AppendArrayToSeq(s: seq<int>, a: array<int>) returns (r: seq<int>)
    requires a != null
    ensures |r| == |s| + a.Length
    ensures forall i :: 0 <= i < |s| ==> r[i] == s[i]
    ensures forall i :: 0 <= i < a.Length ==> r[|s| + i] == a[i]
{
    r := s;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant |r| == |s| + i
        invariant forall j :: 0 <= j < |s| ==> r[j] == s[j]
        invariant forall j :: 0 <= j < i ==> r[|s| + j] == a[j]
    {
        r := r + [a[i]];
    }
}
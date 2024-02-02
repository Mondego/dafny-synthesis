method CountIdenticalPositions(a: seq<int>, b: seq<int>, c: seq<int>) returns (count: int)
    requires |a| == |b| && |b| == |c|
    ensures count >= 0
    ensures count == | set i: int | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
{
    var identical := set i: int | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i];
    count := |identical|;
}
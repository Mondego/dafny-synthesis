method ElementWiseDivision(a: seq<int>, b: seq<int>) returns (result: seq<int>)
    requires |a| == |b|
    requires forall i :: 0 <= i < |b| ==> b[i] != 0
    ensures |result| == |a|
    ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
{
    result := [];
    var i := 0;
    while i < |a|
        invariant 0 <= i <= |a|
        invariant |result| == i
        invariant forall k :: 0 <= k < i ==> result[k] == a[k] / b[k]
    {
        result := result + [a[i] / b[i]];
        i := i + 1;
    }
}
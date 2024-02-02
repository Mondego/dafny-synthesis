method SplitAndAppend(l: seq<int>, n: int) returns (r: seq<int>)
    requires n >= 0 && n < |l|
    ensures |r| == |l|
    ensures forall i :: 0 <= i < |l| ==> r[i] == l[(i + n) % |l|]
{
    var firstPart: seq<int> := l[..n];
    var secondPart: seq<int> := l[n..];
    r := secondPart + firstPart;
}
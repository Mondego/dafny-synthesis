method PowerOfListElements(l: seq<int>, n: int) returns (result: seq<int>)
    requires n >= 0
    ensures |result| == |l|
    ensures forall i :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
{
    result := [];
    for i := 0 to |l|
        invariant 0 <= i <= |l|
        invariant |result| == i
        invariant forall k :: 0 <= k < i ==> result[k] == Power(l[k], n)
    {
        result := result + [Power(l[i], n)];
    }
}

function Power(base: int, exponent: int): int
    requires exponent >= 0
{
    if exponent == 0 then 1
    else base * Power(base, exponent-1)
}
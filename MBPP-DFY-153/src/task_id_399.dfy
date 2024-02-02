method BitwiseXOR(a: seq<bv32>, b: seq<bv32>) returns (result: seq<bv32>)
    requires |a| == |b|
    ensures |result| == |a|
    ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
{
    result := [];
    var i := 0;
    while i < |a|
        invariant 0 <= i <= |a|
        invariant |result| == i
        invariant forall k :: 0 <= k < i ==> result[k] == a[k] ^ b[k]
    {
        result := result + [a[i] ^ b[i]];
        i := i + 1;
    }
}
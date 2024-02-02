method LucidNumbers(n: int) returns (lucid: seq<int>)
    requires n >= 0
    ensures forall i :: 0 <= i < |lucid| ==> lucid[i] % 3 == 0
    ensures forall i :: 0 <= i < |lucid| ==> lucid[i] <= n
    ensures forall i, j :: 0 <= i < j < |lucid| ==> lucid[i] < lucid[j]
{
    lucid := [];
    var i := 0;
    while i <= n
        invariant 0 <= i <= n + 1
        invariant forall k :: 0 <= k < |lucid| ==> lucid[k] % 3 == 0
        invariant forall k :: 0 <= k < |lucid| ==> lucid[k] <= i - 1
        invariant forall k, l :: 0 <= k < l < |lucid| ==> lucid[k] < lucid[l]
    {
        if i % 3 == 0 {
            lucid := lucid + [i];
        }
        i := i + 1;
    }
}
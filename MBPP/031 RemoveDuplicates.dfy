method RemoveDuplicates(a: array<int>) returns (b: array<int>)
    ensures forall i, j :: 0 <= i < j < b.Length ==> b[i] != b[j]
    // Relative order of numbers is preserved
//    ensures forall k, l :: 0 <= k < l < b.Length ==>
//            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m]
{
    var uniques: seq<int> := [];
    var j := 0;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant forall k, l :: 0 <= k < l < |uniques| ==> uniques[k] != uniques[l]
//        invariant forall k, l :: 0 <= k < l < |uniques| ==>
//            exists n, m :: 0 <= n < m < i && uniques[k] == a[n] && uniques[l] == a[m]

    {
        if a[i] !in uniques 
        {
            uniques := uniques + [a[i]];
            j := j + 1;
        }
    }
    b := new int[|uniques|](i requires 0 <= i < |uniques| => uniques[i]);
}

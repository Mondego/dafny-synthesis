method RemoveDuplicates(a: array<int>) returns (b: array<int>)
    ensures forall i, j :: 0 <= i < j < b.Length ==> b[i] != b[j]
    // All unique numbers of the input are in the output, and vice-versa
    ensures forall x :: x in a[..] <==> x in b[..]
    // Relative order of numbers is preserved
//    ensures forall k, l :: 0 <= k < l < b.Length ==>
//            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m]
{
    var uniques: seq<int> := [];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        // Ensure distinct elements in uniques
        invariant forall k, l :: 0 <= k < l < |uniques| ==> uniques[k] != uniques[l]
        // Ensure all elements in uniques are in a[..i]
        invariant forall x :: x in uniques <==> x in a[..i]

//        invariant forall k, l :: 0 <= k < l < |uniques| ==>
//            exists n, m :: 0 <= n < m < i && uniques[k] == a[n] && uniques[l] == a[m]

    {
        if a[i] !in uniques 
        {
            uniques := uniques + [a[i]];
        }
    }
    b := new int[|uniques|](i requires 0 <= i < |uniques| => uniques[i]);
    assert uniques == b[..];
}

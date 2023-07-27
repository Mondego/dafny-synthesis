method RemoveDuplicates(a: array<int>) returns (b: array<int>)
{
    var uniques: seq<int> := [];
    ghost var indices: seq<int> := [];
    for i := 0 to a.Length

        /* 
          * The next invariants are for the 3rd postcondition, relative order preservation
         */

            exists n, m :: 0 <= n < m < i && uniques[k] == a[n] && uniques[l] == a[m]

    {
        if a[i] !in uniques 
        {
            uniques := uniques + [a[i]];
            indices := indices + [i];
            assert indices[|indices|-1] == i;
        }
        assert forall idx :: idx in indices ==> exists m :: 0 <= m <= i && a[idx] == a[m];
        assert forall k :: 0 <= k < |indices| ==> uniques[k] in a[..i+1];
    }
    assert forall k, l :: 0 <= k < l < |uniques| ==>
            exists n, m :: 0 <= n < m < a.Length && uniques[k] == a[n] && uniques[l] == a[m];

    b := new int[|uniques|](i requires 0 <= i < |uniques| => uniques[i]);

    assert uniques == b[..];
    assert forall k, l :: 0 <= k < l < b.Length ==>
            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m];
}

method RemoveDuplicates(a: array<int>) returns (b: array<int>)
    ensures forall i, j :: 0 <= i < j < b.Length ==> b[i] != b[j]
    ensures forall x :: x in a[..] <==> x in b[..]
    ensures forall k, l :: 0 <= k < l < b.Length ==> exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m]
{
    var uniques: seq<int> := [];
    ghost var indices: seq<int> := [];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant |uniques| <= i
        invariant forall k, l :: 0 <= k < l < |uniques| ==> uniques[k] != uniques[l]
        invariant forall x :: x in uniques <==> x in a[..i]

        /* 
          * The next invariants are for the 3rd postcondition, relative order preservation
         */
        invariant forall x :: x !in a[..i] ==> x !in uniques
        invariant |uniques| == |indices|
        invariant forall k, l :: 0 <= k < l < |indices| ==> indices[k] != indices[l]
        invariant forall k :: 0 <= k < |indices| ==> indices[k] < i
        invariant forall k, l :: 0 <= k < l < |indices| ==> indices[k] < indices[l]
        invariant forall k :: 0 <= k < |uniques| ==> 0 <= indices[k] < i && uniques[k] == a[indices[k]]

        invariant forall k, l :: 0 <= k < l < |uniques| ==> 
            exists n, m :: 0 <= n < m < i && uniques[k] == a[n] && uniques[l] == a[m]

    {
        if a[i] !in uniques 
        {
            uniques := uniques + [a[i]];
            indices := indices + [i];
        }
    }
            exists n, m :: 0 <= n < m < a.Length && uniques[k] == a[n] && uniques[l] == a[m];

    b := new int[|uniques|](i requires 0 <= i < |uniques| => uniques[i]);

            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m];
}

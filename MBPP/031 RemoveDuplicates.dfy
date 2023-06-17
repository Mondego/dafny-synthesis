method RemoveDuplicates(a: array<int>) returns (b: array<int>)
    // All numbers in the array are distinct
    ensures forall i, j :: 0 <= i < j < b.Length ==> b[i] != b[j]
    // All unique numbers of the input are in the output, and vice-versa
    ensures forall x :: x in a[..] <==> x in b[..]
    // Relative order of numbers is preserved
    ensures forall k, l :: 0 <= k < l < b.Length ==>
            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m]
{
    var uniques: seq<int> := [];
    // We need the ghost variable indices to prove relative order preservation
    ghost var indices: seq<int> := [];
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant |uniques| <= i
        // All elements in uniques are distinct (1st postcondition)
        invariant forall k, l :: 0 <= k < l < |uniques| ==> uniques[k] != uniques[l]
        // Ensure all elements in uniques are in a[..i] and vice-versa (2nd postcondition)
        invariant forall x :: x in uniques <==> x in a[..i]

        /* 
          * The next invariants are for the 3rd postcondition, relative order preservation
         */
         // If an element is not in the input, it's also not in uniques
        invariant forall x :: x !in a[..i] ==> x !in uniques
        // Uniques and indices always have the same size
        invariant |uniques| == |indices|
        // All elements in indices are distinct
        invariant forall k, l :: 0 <= k < l < |indices| ==> indices[k] != indices[l]
        // All elements in indices are smaller than the current i
        invariant forall k :: 0 <= k < |indices| ==> indices[k] < i
        // Order of elements in indices is strictly increasing
        invariant forall k, l :: 0 <= k < l < |indices| ==> indices[k] < indices[l]
        // All elements i position k in uniques have a presence in the input, at exactly indices[k]
        invariant forall k :: 0 <= k < |uniques| ==> 0 <= indices[k] < i && uniques[k] == a[indices[k]]

        // Finally, relative order of elements between uniques and the input is preserved
        invariant forall k, l :: 0 <= k < l < |uniques| ==> 
            exists n, m :: 0 <= n < m < i && uniques[k] == a[n] && uniques[l] == a[m]

    {
        if a[i] !in uniques 
        {
            uniques := uniques + [a[i]];
            indices := indices + [i];
            // We need to remind the verifier about the contents of indices
            assert indices[|indices|-1] == i;
        }
        // We also need to remind the verifier about this, at this point
        assert forall idx :: idx in indices ==> exists m :: 0 <= m <= i && a[idx] == a[m];
        assert forall k :: 0 <= k < |indices| ==> uniques[k] in a[..i+1];
    }
    // Another necessary hint for the verifier
    assert forall k, l :: 0 <= k < l < |uniques| ==>
            exists n, m :: 0 <= n < m < a.Length && uniques[k] == a[n] && uniques[l] == a[m];

    b := new int[|uniques|](i requires 0 <= i < |uniques| => uniques[i]);

    // These two are also necessary hints for the verifier
    assert uniques == b[..];
    assert forall k, l :: 0 <= k < l < b.Length ==>
            exists n, m :: 0 <= n < m < a.Length && b[k] == a[n] && b[l] == a[m];
}

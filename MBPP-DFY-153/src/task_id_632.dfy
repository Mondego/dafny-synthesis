method MoveZeroesToEnd(arr: array<int>)
    requires arr.Length >= 2
    modifies arr
    // Same size
    ensures arr.Length == old(arr.Length)
    // Zeros to the right of the first zero
    ensures forall i, j :: 0 <= i < j < arr.Length && arr[i] == 0 ==> arr[j] == 0
    // The final array is a permutation of the original one
    ensures multiset(arr[..]) == multiset(old(arr[..]))
    // Relative order of non-zero elements is preserved
    ensures forall n, m /* on old array */:: 0 <= n < m < arr.Length && old(arr[n]) != 0 && old(arr[m]) != 0 ==> 
            exists k, l /* on new array */:: 0 <= k < l < arr.Length && arr[k] == old(arr[n]) && arr[l] == old(arr[m])
    //ensures IsOrderPreserved(arr[..], old(arr[..]))
    // Number of zeros is preserved
{
    var i := 0;
    var j := 0;

    assert 0 <= i  <= arr.Length;
    assert forall k :: 0 <= k < arr.Length ==> arr[k] == old(arr[k]);
    //assert(forall n, m :: 0 <= n < m < arr.Length  ==> arr[n] == old(arr[n]) && arr[m] == old(arr[m]));
    while j < arr.Length
        invariant 0 <= i <= j <= arr.Length
        // Elements to the right of j are unchanged
        invariant forall k :: j <= k < arr.Length ==> old(arr[k]) == arr[k]
        // Everything to the left of i is non-zero
        invariant forall k :: 0 <= k < i ==> arr[k] != 0
        // Everything between i and j, but excluding j, is zero
        invariant forall k :: i <= k < j ==> arr[k] == 0
        // If there there are zeros, they are to the right of i
        invariant forall k :: 0 <= k < j && arr[k] == 0 ==> k >= i
        // No new numbers are added, up to j
        invariant forall k :: 0 <= k < j && arr[k] != old(arr[k]) ==> exists l :: 0 <= l < j && arr[k] == old(arr[l])
        // The new array up to j is always a permutation of the original one
        invariant multiset(arr[..]) == multiset(old(arr[..]))
        // Relative order of non-zero elements is always preserved
        //invariant IsOrderPreserved(arr[..], old(arr[..]))
        invariant forall n, m /* on old */:: 0 <= n < m < j && old(arr[n]) != 0 && old(arr[m]) != 0 ==> 
            exists k, l /* on new */:: 0 <= k < l < i && arr[k] == old(arr[n]) && arr[l] == old(arr[m])
    {

        if arr[j] != 0
        {
            if i != j
            {
                assert(arr[j] != 0);
                swap(arr, i, j);
                assert(forall k :: 0 <= k <= j ==> exists l :: 0 <= l <= j && arr[k] == old(arr[l]));
            }
            i := i + 1;
        }
        j := j + 1;
    }
    assert j == arr.Length;
}

method swap(arr: array<int>, i: int, j: int)
    requires arr.Length > 0
    requires 0 <= i < arr.Length && 0 <= j < arr.Length
    modifies arr
    ensures arr[i] == old(arr[j]) && arr[j] == old(arr[i])
    ensures forall k :: 0 <= k < arr.Length && k != i && k != j ==> arr[k] == old(arr[k])
    ensures multiset(arr[..]) == multiset(old(arr[..]))
{
        var tmp := arr[i];
        arr[i] := arr[j];
        arr[j] := tmp;
}

function count(arr: seq<int>, value: int) : (c: nat)
    ensures c <= |arr|
{
    if |arr| == 0 then 0 else (if arr[0] == value then 1 else 0) + count(arr[1..], value)
}


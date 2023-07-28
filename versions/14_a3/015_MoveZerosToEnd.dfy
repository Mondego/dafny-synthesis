method MoveZeroesToEnd(arr: array<int>)
    requires arr.Length >= 2
    modifies arr
    ensures arr.Length == old(arr.Length)
    ensures forall i, j :: 0 <= i < j < arr.Length && arr[i] == 0 ==> arr[j] == 0
    ensures multiset(arr[..]) == multiset(old(arr[..]))
    ensures forall n, m /* on old array */:: 0 <= n < m < arr.Length && old(arr[n]) != 0 && old(arr[m]) != 0 ==> 
            exists k, l /* on new array */:: 0 <= k < l < arr.Length && arr[k] == old(arr[n]) && arr[l] == old(arr[m])
    //ensures IsOrderPreserved(arr[..], old(arr[..]))
{
    var i := 0;
    var j := 0;

    //assert(forall n, m :: 0 <= n < m < arr.Length  ==> arr[n] == old(arr[n]) && arr[m] == old(arr[m]));
    while j < arr.Length
        invariant 0 <= i <= j <= arr.Length
        invariant forall k :: j <= k < arr.Length ==> old(arr[k]) == arr[k]
        invariant forall k :: 0 <= k < i ==> arr[k] != 0
        invariant forall k :: i <= k < j ==> arr[k] == 0
        invariant forall k :: 0 <= k < j && arr[k] == 0 ==> k >= i
        invariant forall k :: 0 <= k < j && arr[k] != old(arr[k]) ==> exists l :: 0 <= l < j && arr[k] == old(arr[l])
        invariant multiset(arr[..]) == multiset(old(arr[..]))
        //invariant IsOrderPreserved(arr[..], old(arr[..]))
        invariant forall n, m /* on old */:: 0 <= n < m < j && old(arr[n]) != 0 && old(arr[m]) != 0 ==> 
            exists k, l /* on new */:: 0 <= k < l < i && arr[k] == old(arr[n]) && arr[l] == old(arr[m])
    {

        if arr[j] != 0
        {
            if i != j
            {
                swap(arr, i, j);
            }
            i := i + 1;
        }
        j := j + 1;
    }
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


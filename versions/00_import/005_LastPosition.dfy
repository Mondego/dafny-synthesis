method LastPosition(arr: array<int>, elem: int) returns (pos: int)
    requires arr.Length > 0
    requires forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
    ensures pos == -1 || (0 <= pos < arr.Length && arr[pos] == elem && (pos <= arr.Length - 1 || arr[pos + 1] > elem))
    ensures forall i :: 0 <= i < arr.Length ==> arr[i] == old(arr[i])
{
    pos := -1;
    for i := 0 to arr.Length - 1
        invariant 0 <= i <= arr.Length
        invariant pos == -1 || (0 <= pos < i && arr[pos] == elem && (pos == i - 1 || arr[pos + 1] > elem))
        invariant forall k :: 0 <= k < arr.Length ==> arr[k] == old(arr[k])
    {
        if arr[i] == elem
        {
            pos := i;
        }
    }
}
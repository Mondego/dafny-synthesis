/**
 * Find even numbers from an array of numbers
 **/

predicate IsEven(n: int)
{
    n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenList: seq<int>)
    ensures forall i :: 0 <= i < |evenList| ==> IsEven(evenList[i]) && evenList[i] in arr[..]
    ensures forall i :: 0 <= i < arr.Length && IsEven(arr[i]) ==> arr[i] in evenList
{
    evenList := [];
    for i := 0 to arr.Length
        invariant 0 <= i <= arr.Length
        invariant 0 <= |evenList| <= i
        invariant forall k :: 0 <= k < |evenList| ==> IsEven(evenList[k]) && evenList[k] in arr[..]
        invariant forall k :: 0 <= k < i && IsEven(arr[k]) ==> arr[k] in evenList
    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
        }
    }
}

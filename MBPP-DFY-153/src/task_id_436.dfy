/**
 * Find negative numbers from an array of numbers
 **/

predicate IsNegative(n: int)
{
    n < 0
}

method FindNegativeNumbers(arr: array<int>) returns (negativeList: seq<int>)
    // All numbers in the output are negative and exist in the input 
    ensures forall i :: 0 <= i < |negativeList| ==> IsNegative(negativeList[i]) && negativeList[i] in arr[..]
    // All negative numbers in the input are in the output
    ensures forall i :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
{
    negativeList := [];
    for i := 0 to arr.Length
        invariant 0 <= i <= arr.Length
        invariant 0 <= |negativeList| <= i
        invariant forall k :: 0 <= k < |negativeList| ==> IsNegative(negativeList[k]) && negativeList[k] in arr[..]
        invariant forall k :: 0 <= k < i && IsNegative(arr[k]) ==> arr[k] in negativeList
    {
        if IsNegative(arr[i])
        {
            negativeList := negativeList + [arr[i]];
        }
    }
}
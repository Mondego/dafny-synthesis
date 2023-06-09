predicate IsEven(n: int)
{
    n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenNumbers: array<int>)
    // All numbers in the output are even and exist in the input 
    ensures forall i :: 0 <= i < evenNumbers.Length ==> IsEven(evenNumbers[i]) && evenNumbers[i] in arr[..]
    // All even numbers in the input are in the output
    ensures forall i :: 0 <= i < arr.Length && IsEven(arr[i]) ==> arr[i] in evenNumbers[..]
{
    var evenList: seq<int> := [];
    for i := 0 to arr.Length
        invariant 0 <= i <= arr.Length
        invariant 0 <= |evenList| <= i
        invariant forall k :: 0 <= k < i && IsEven(arr[k]) ==> arr[k] in evenList
        invariant forall k :: 0 <= k < |evenList| ==> IsEven(evenList[k]) && evenList[k] in arr[..i]
    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
        }
    }

    assert forall k :: 0 <= k < |evenList| ==> IsEven(evenList[k]) && evenList[k] in arr[..]; 
    assert forall k :: 0 <= k < arr.Length && IsEven(arr[k]) ==> arr[k] in evenList;

    evenNumbers := new int[|evenList|](i requires 0 <= i < |evenList| => evenList[i]);
    assert evenList == evenNumbers[..];
}

function CountEven(s: seq<int>) : nat
{
    if |s| == 0 then 0
    else (if IsEven(s[0]) then 1 else 0) + CountEven(s[1..])
}

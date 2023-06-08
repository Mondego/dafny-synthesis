predicate IsEven(n: int)
{
    n % 2 == 0
}

//method FindEvenNumbers(arr: array<int>) returns (evenNumbers: array<int>)
method FindEvenNumbers(arr: array<int>) returns (evenList: seq<int>)
    ensures forall i :: 0 <= i < |evenList| ==> IsEven(evenList[i])
    ensures forall i :: 0 <= i < arr.Length && IsEven(arr[i]) ==> exists j :: 0 <= j < |evenList| && arr[i] == evenList[j]
{
//    var evenList: seq<int> := [];
    evenList := [];
    for i := 0 to arr.Length
        invariant 0 <= i <= arr.Length
        invariant forall k :: 0 <= k < i && IsEven(arr[k]) ==> arr[k] in evenList
        invariant forall k :: 0 <= k < |evenList| ==> IsEven(evenList[k])
        invariant forall k :: 0 <= k < i && IsEven(arr[k]) ==> exists j :: 0 <= j < |evenList| && arr[k] == evenList[j]
    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
        }
    }

/*
    evenNumbers := new int[|evenList|];
    for i := 0 to |evenList|
        invariant 0 <= i <= |evenList|
        invariant forall k :: 0 <= k < i ==> IsEven(evenNumbers[k])
        invariant forall k :: 0 <= k < i ==> exists j :: 0 <= j < arr.Length && arr[j] == evenList[k] 
    {
        evenNumbers[i] := evenList[i];
    }
    */
}


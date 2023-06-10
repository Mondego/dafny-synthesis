/**
 * Find even numbers from an array of numbers
 **/

predicate IsEven(n: int)
{
    n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenNumbers: array<int>)
    // All even numbers in the input are in the output
    ensures forall x :: x in arr[..] && IsEven(x) ==> x in evenNumbers[..];
    // If a number is not in the input, it's also not in the output 
    ensures forall x :: x !in arr[..] ==> x !in evenNumbers[..]
    // Relative order of even numbers is preserved?? How to prove??
{
    var evenList: seq<int> := [];
    for i := 0 to arr.Length
        invariant 0 <= i <= arr.Length
        invariant 0 <= |evenList| <= i
        invariant forall x :: x in arr[..i] && IsEven(x) ==> x in evenList[..]
        invariant forall x :: x !in arr[..i] ==> x !in evenList
    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
        }
    }

    evenNumbers := new int[|evenList|](i requires 0 <= i < |evenList| => evenList[i]);
    assert evenList == evenNumbers[..];
}

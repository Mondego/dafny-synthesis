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
    // Relative order of even numbers is preserved
    ensures forall k, l :: 0 <= k < l < evenNumbers.Length ==>
            exists n, m :: 0 <= n < m < arr.Length && evenNumbers[k] == arr[n] && evenNumbers[l] == arr[m]
{
    var evenList: seq<int> := [];
    ghost var indices: seq<int> := [];
    for i := 0 to arr.Length
           exists n, m :: 0 <= n < m < i && evenList[k] == arr[n] && evenList[l] == arr[m]

    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
            indices := indices + [i];
        }
    }

    evenNumbers := new int[|evenList|](i requires 0 <= i < |evenList| => evenList[i]);
    assert evenList == evenNumbers[..];
}

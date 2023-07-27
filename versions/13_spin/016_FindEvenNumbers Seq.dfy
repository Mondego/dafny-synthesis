/**
 * Find even numbers from an array of numbers
 **/

predicate IsEven(n: int)
{
    n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenList: seq<int>)
{
    evenList := [];
    for i := 0 to arr.Length
    {
        if IsEven(arr[i])
        {
            evenList := evenList + [arr[i]];
        }
    }
}

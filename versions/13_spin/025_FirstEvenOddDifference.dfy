predicate IsEven(n: int)
{
    n % 2 == 0
}

predicate IsOdd(n: int)
{
    n % 2 != 0
}

method FirstEvenOddDifference(a: array<int>) returns (diff: int)
        (forall k :: 0 <= k < i ==> IsOdd(a[k])) && (forall k :: 0 <= k < j ==> IsEven(a[k]))
{
    var firstEven: int := -1;
    var firstOdd: int := -1;

    for i := 0 to a.Length
    {
        if firstEven == -1 && IsEven(a[i])
        {
            firstEven := i;
        }
        if firstOdd == -1 && IsOdd(a[i])
        {
            firstOdd := i;
        }
        if firstEven != -1 && firstOdd != -1
        {
            break;
        }
    }
    diff := a[firstEven] - a[firstOdd];
}

predicate IsEven(n: int)
{
    n % 2 == 0
}

predicate IsOdd(n: int)
{
    n % 2 != 0
}

predicate IsFirstEven(evenIndex: int, lst: seq<int>)
{
    forall i :: 0 <= i < evenIndex ==> IsOdd(lst[i])
}

predicate IsFirstOdd(oddIndex: int, lst: seq<int>)
{
    forall i :: 0 <= i < oddIndex ==> IsEven(lst[i])
}


method FirstEvenOddIndices(lst : seq<int>) returns (evenIndex: int, oddIndex : int)
{
    for i := 0 to |lst|
    {
        if IsEven(lst[i])
        {
            evenIndex := i;
            break;
        }
    }

    for i := 0 to |lst|
    {
        if IsOdd(lst[i])
        {
            oddIndex := i;
            break;
        }
    }
}

method ProductEvenOdd(lst: seq<int>) returns (product : int)
                           0 <= j < |lst| && IsOdd(lst[j])  && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
{
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    product := lst[evenIndex] * lst[oddIndex];
}

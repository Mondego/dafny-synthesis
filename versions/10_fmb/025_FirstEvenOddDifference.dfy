predicate IsEven(n: int)
{
    n % 2 == 0
}

predicate IsOdd(n: int)
{
    n % 2 != 0
}

method FirstEvenOddDifference(a: array<int>) returns (diff: int)
    requires a.Length >= 2
    requires exists i :: 0 <= i < a.Length && IsEven(a[i])
    requires exists i :: 0 <= i < a.Length && IsOdd(a[i])
    ensures exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && IsOdd(a[j]) && diff == a[i] - a[j] && 
        (forall k :: 0 <= k < i ==> IsOdd(a[k])) && (forall k :: 0 <= k < j ==> IsEven(a[k]))
{
}

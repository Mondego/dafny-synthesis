function sumTo( a:array<int>, n:int ) : int
  decreases n;
{
  if (n == 0) then 0 else sumTo(a, n-1) + a[n-1]
}

method ArraySum(a: array<int>) returns (result: int)
{
    result := 0;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant result == sumTo(a, i)
    {
        result := result + a[i];
    }
}

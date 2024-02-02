function countTo( a:array<bool>, n:int ) : int
  requires a != null;
  requires 0 <= n && n <= a.Length;
  decreases n;
  reads a;
{
  if (n == 0) then 0 else countTo(a, n-1) + (if a[n-1] then 1 else 0)
}

method CountTrue(a: array<bool>) returns (result: int)
    requires a != null
    ensures result == countTo(a, a.Length)
{
    result := 0;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant result == countTo(a, i)
    {
        if a[i] {
            result := result + 1;
        }
    }
}
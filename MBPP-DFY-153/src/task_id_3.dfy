method IsNonPrime(n: int) returns (result: bool)
    requires n >= 2
    ensures result <==> (exists k :: 2 <= k < n && n % k == 0)
{
    result := false;
    var i := 2;
    while i <= n/2
        invariant 2 <= i
        invariant result <==> (exists k :: 2 <= k < i && n % k == 0)
    {
        if n % i == 0
        {
            result := true;
            break;
        }
        i := i + 1;
    }
}
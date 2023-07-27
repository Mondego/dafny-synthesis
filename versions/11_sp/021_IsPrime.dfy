method IsPrime(n: int) returns (result: bool)
{
    result := true;
    var i := 2;
    while i <= n/2
        invariant 2 <= i
        invariant result <==> (forall k :: 2 <= k < i ==> n % k != 0)
    {
        if n % i == 0
        {
            result := false;
            break;
        }
        i := i + 1;
    }
}

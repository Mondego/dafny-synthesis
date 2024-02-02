method IsEven(n: int) returns (result: bool)
    ensures result <==> n % 2 == 0
{
    result := n % 2 == 0;
}
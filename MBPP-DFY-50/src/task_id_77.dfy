method IsDivisibleBy11(n: int) returns (result: bool)
  ensures result <==> n % 11 == 0
{
  result := n % 11 == 0;
}
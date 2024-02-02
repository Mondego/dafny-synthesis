//"task_id": "77",
//"task_description": "Write a method in Dafny to find whether a number is divisible by 11.",

method IsDivisibleBy11(n: int) returns (result: bool)
  ensures result <==> n % 11 == 0
{
  result := n % 11 == 0;
}
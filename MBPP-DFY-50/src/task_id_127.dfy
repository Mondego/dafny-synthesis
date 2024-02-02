//Write a method in Dafny to multiply two integers.

method Multiply(a: int, b: int) returns (result: int)
  ensures result == a * b
{
  result := a * b;
}
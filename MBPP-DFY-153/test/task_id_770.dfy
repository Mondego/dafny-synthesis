method SumOfFourthPowerOfOddNumbers(n: int) returns (sum: int)
  requires n > 0
  ensures sum == n * (2 * n + 1) * (24 * n * n * n - 12 * n * n  - 14 * n + 7) / 15
{
  sum := 0;
  var i := 1;
  for k := 0 to n
    invariant 0 <= k <= n
    invariant i == 2 * k + 1
    invariant sum == k * (2 * k + 1) * (24 * k * k * k - 12 * k * k  - 14 * k + 7) / 15
  {
    sum := sum + i * i * i * i;
    i := i + 2;
  }
}

method SumOfFourthPowerOfOddNumbersTest(){
  
  var out1:=SumOfFourthPowerOfOddNumbers(2);
  assert out1==82;

  var out2:=SumOfFourthPowerOfOddNumbers(3);
  assert out2==707;

  var out3:=SumOfFourthPowerOfOddNumbers(4);
  assert out3==3108;

}

method Main(){
  SumOfFourthPowerOfOddNumbersTest();
}

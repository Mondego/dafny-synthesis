method SumOfSquaresOfFirstNOddNumbers(n: int) returns (sum: int)
  requires n >= 0
  ensures sum == (n * (2 * n - 1) * (2 * n + 1)) / 3
{
  sum := 0;
  var i := 1;
  for k:=0 to n
    invariant 0 <= k <= n
    invariant sum == k * (2 * k - 1) * (2 * k + 1) / 3
    invariant i == 2 * k + 1
  {
    sum := sum + i * i;
    i := i + 2;
  }
}


method SumOfSquaresOfFirstNOddNumbersTest(){
  var out1:=SumOfSquaresOfFirstNOddNumbers(2);
  assert out1==10;

  var out2:=SumOfSquaresOfFirstNOddNumbers(3);
  assert out2==35;

  var out3:=SumOfSquaresOfFirstNOddNumbers(4);
  assert out3==84;
  
}

method Main(){
  SumOfSquaresOfFirstNOddNumbersTest();
}

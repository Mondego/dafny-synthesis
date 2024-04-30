method SumAndAverage(n: int) returns (sum: int, average: real)
  requires n > 0
  ensures sum == n * (n + 1) / 2
  ensures average == sum as real / n as real
{
  sum := 0;
  for i := 1 to n + 1
    invariant 0 <= i <= n + 1
    invariant sum == (i - 1) * i / 2
  {
    sum := sum + i;
  }
  average := sum as real / n as real;
}

method SumAndAverageTest(){
  var sum1, avg1 :=SumAndAverage(10);
  assert sum1==55;
  assert avg1==5.5;

  var sum2, avg2 :=SumAndAverage(15);
  assert sum2==120;
  assert avg2==8.0;

  var sum3, avg3 :=SumAndAverage(20);
  assert sum3==210;
  assert avg3==10.5;

}

method Main(){
  SumAndAverageTest();
}

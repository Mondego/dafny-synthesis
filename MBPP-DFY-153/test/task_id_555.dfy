method DifferenceSumCubesAndSumNumbers(n: int) returns (diff: int)
  requires n >= 0
  ensures diff == (n * n * (n + 1) * (n + 1)) / 4 - (n * (n + 1)) / 2
{
  var sumCubes := 0;
  var sumNumbers := 0;
  for i := 1 to n + 1
    invariant 0 <= i <= n + 1
    invariant sumCubes == (i - 1) * (i - 1) * i * i / 4
    invariant sumNumbers == (i - 1) * i / 2
  {
    sumCubes := sumCubes + i * i * i;
    sumNumbers := sumNumbers + i;
  }
  diff := sumCubes - sumNumbers;
}

method DifferenceSumCubesAndSumNumbersTest(){
  var res1:= DifferenceSumCubesAndSumNumbers(3);
  print(res1);print("\n");
  assert res1==30;

  var res2:= DifferenceSumCubesAndSumNumbers(5);
  print(res2);print("\n");
  assert res2==210;

  var res3:= DifferenceSumCubesAndSumNumbers(2);
  print(res3);print("\n");
  assert res3==6;


}

method Main(){
  DifferenceSumCubesAndSumNumbersTest();
}

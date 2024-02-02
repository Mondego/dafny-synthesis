method NthHexagonalNumber(n: int) returns (hexNum: int)
  requires n >= 0
  ensures hexNum == n * ((2 * n) - 1)
{
  hexNum := n * ((2 * n) - 1);
}

method NthHexagonalNumberTest(){
  var res1:= NthHexagonalNumber(10);
  print(res1);print("\n");
  assert res1==190;
  var res2:= NthHexagonalNumber(5);
  print(res2);print("\n");
  assert res2==45;
  var res3:= NthHexagonalNumber(7);
  print(res3);print("\n");
  assert res3==91;
}

method Main(){
  NthHexagonalNumberTest();
}
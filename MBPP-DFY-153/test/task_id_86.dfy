method CenteredHexagonalNumber(n: nat) returns (result: nat)
  requires n >= 0
  ensures result == 3 * n * (n - 1) + 1
{
  result := 3 * n * (n - 1) + 1;
}

method CenteredHexagonalNumberTest(){
  var res1:= CenteredHexagonalNumber(10);
  print(res1); print("\n");
  assert res1==271;

  var res2:= CenteredHexagonalNumber(2);
  print(res2); print("\n");
  assert res2==7;

  var res3:= CenteredHexagonalNumber(9);
  print(res3); print("\n");
  assert res3==217;

}

method Main(){
  CenteredHexagonalNumberTest();
}

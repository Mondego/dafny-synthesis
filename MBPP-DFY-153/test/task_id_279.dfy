method NthDecagonalNumber(n: int) returns (decagonal: int)
  requires n >= 0
  ensures decagonal == 4 * n * n - 3 * n
{
  decagonal := 4 * n * n - 3 * n;
}

method NthDecagonalNumberTest(){
  var res1:=NthDecagonalNumber(3);
  print(res1);print("\n");
  assert res1==27;
  var res2:=NthDecagonalNumber(7);
  print(res2);print("\n");
  assert res2==175;
  var res3:=NthDecagonalNumber(10);
  print(res3);print("\n");
  assert res3==370;

}

method Main(){
  NthDecagonalNumberTest();
}
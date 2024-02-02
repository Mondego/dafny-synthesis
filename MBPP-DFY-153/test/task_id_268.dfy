method StarNumber(n: int) returns (star: int)
  requires n >= 0
  ensures star == 6 * n * (n - 1) + 1
{
  star := 6 * n * (n - 1) + 1;
}

method StarNumberTest(){
  var res1:=StarNumber(3);
  print(res1);print("\n");
  assert res1==37;
  var res2:=StarNumber(4);
  print(res2);print("\n");
  assert res2==73;
  var res3:=StarNumber(5);
  print(res3);print("\n");
  assert res3==121;
}

method Main(){
  StarNumberTest();
}
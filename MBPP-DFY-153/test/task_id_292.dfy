method Quotient(a: int, b: int) returns (result: int)
  requires b != 0
  ensures result == a / b
{
  result := a / b;
}

method QuotientTest(){
  var res1:=Quotient(10,3);
  print(res1);print("\n");
  assert res1==3;
  var res2:=Quotient(4,2);
  print(res2);print("\n");
  assert res2==2;
  var res3:=Quotient(20,5);
  print(res3);print("\n");
  assert res3==4;
}

method Main(){
  QuotientTest();
}
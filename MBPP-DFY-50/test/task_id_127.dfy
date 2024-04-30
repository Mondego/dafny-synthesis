method Multiply(a: int, b: int) returns (result: int)
  ensures result == a * b
{
  result := a * b;
}

method MultiplyTest(){
  var out1:=Multiply(10,20);
  assert out1==200;

  var out2:=Multiply(5,10);
  assert out2==50;

  var out3:=Multiply(4,8);
  assert out3==32;

}

method Main(){
  MultiplyTest();
}

method IsEven(n: int) returns (result: bool)
  ensures result <==> n % 2 == 0
{
  result := n % 2 == 0;
}

method IsEvenTest(){
  var out1:=IsEven(1);
  print(out1);print("\n");
  assert out1==false;

  var out2:=IsEven(2);
  print(out2);print("\n");
  assert out2==true;

  var out3:=IsEven(3);
  print(out3);print("\n");
  assert out3==false;

}

method Main(){
  IsEvenTest();
}

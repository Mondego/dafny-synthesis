method IsEven(n: int) returns (result: bool)
  ensures result <==> n % 2 == 0
{
  result := n % 2 == 0;
}

method IsEvenTest(){
  var out1:=IsEven(1);
  assert out1==false;

  var out2:=IsEven(2);
  assert out2==true;

  var out3:=IsEven(3);
  assert out3==false;
  
}

method Main(){
  IsEvenTest();
}

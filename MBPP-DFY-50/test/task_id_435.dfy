method LastDigit(n: int) returns (d: int)
  requires n >= 0
  ensures 0 <= d < 10
  ensures n % 10 == d
{
  d := n % 10;
}

method LastDigitTest(){
  var out1:=LastDigit(123);
  assert out1==3;

  var out2:=LastDigit(25);
  assert out2==5;

  var out3:=LastDigit(30);
  assert out3==0;

}

method Main(){
  LastDigitTest();
}

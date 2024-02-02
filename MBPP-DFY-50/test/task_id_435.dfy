method LastDigit(n: int) returns (d: int)
  requires n >= 0
  ensures 0 <= d < 10
  ensures n % 10 == d
{
  d := n % 10;
}

method LastDigitTest(){
  var out1:=LastDigit(123);
  print(out1);print("\n");
  assert out1==3;

  var out2:=LastDigit(25);
  print(out2);print("\n");
  assert out2==5;

  var out3:=LastDigit(30);
  print(out3);print("\n");
  assert out3==0;

}

method Main(){
  LastDigitTest();
}

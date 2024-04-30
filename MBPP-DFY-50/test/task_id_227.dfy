method MinOfThree(a: int, b: int, c: int) returns (min: int)
  ensures min <= a && min <= b && min <= c
  ensures (min == a) || (min == b) || (min == c)
{
  if (a <= b && a <= c) {
    min := a;
  } else if (b <= a && b <= c) {
    min := b;
  } else {
    min := c;
  }
}

method MinOfThreeTest(){
  var out1:=MinOfThree(10,20,0);
  assert out1==0;
  
  var out2:=MinOfThree(19,15,18);
  assert out2==15;

  var out3:=MinOfThree(10,-20,-30);
  assert out3==-30;

}

method Main(){
  MinOfThreeTest();
}

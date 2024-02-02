method MedianOfThree(a: int, b: int, c: int) returns (median: int)
  ensures median == a || median == b || median == c
  ensures (median >= a && median <= b) || (median >= b && median <= a) || (median >= a && median <= c) || (median >= c && median <= a) || (median >= b && median <= c) || (median >= c && median <= b)
{
  if ((a <= b && b <= c) || (c <= b && b <= a)) {
    median := b;
  } else if ((b <= a && a <= c) || (c <= a && a <= b)) {
    median := a;
  } else {
    median := c;
  }
}


method MedianOfThreeTest(){
  var out1:=MedianOfThree(25,55,65);
  print(out1);print("\n");
              //assert out1==55;
  var out2:=MedianOfThree(20,10,30);
  print(out2);print("\n");
              //assert out2==20;
  var out3:=MedianOfThree(15,45,75);
  print(out3);print("\n");
              //assert out3==45;
}

method Main(){
  MedianOfThreeTest();
}

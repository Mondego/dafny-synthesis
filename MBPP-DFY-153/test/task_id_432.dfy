method MedianLength(a: int, b: int) returns (median: int)
  requires a > 0 && b > 0
  ensures median == (a + b) / 2
{
  median := (a + b) / 2;
}


method MedianLengthTest(){

  var res1:=MedianLength(15,25,35);
  assert res1==20.0;
  var res2:=MedianLength(10,20,30);
  assert res2==15.0;
  var res3:=MedianLength(6,9,4);
  assert res3==7.5;


}

method Main(){
  MedianLengthTest();
}

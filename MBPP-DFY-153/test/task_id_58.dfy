method HasOppositeSign(a: int, b: int) returns (result: bool)
  ensures result <==> (a < 0 && b > 0) || (a > 0 && b < 0)
{
  result := (a < 0 && b > 0) || (a > 0 && b < 0);
}

method HasOppositeSignTest(){
  var out1:=HasOppositeSign(1,-2);
  assert out1==true;

  var out2:=HasOppositeSign(3,2);
  assert out2==false;
  
  var out3:=HasOppositeSign(-2,2);
  assert out3==true;

}

method Main(){
  HasOppositeSignTest();
}

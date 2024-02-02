method AsciiValue(c: char) returns (ascii: int)
  ensures ascii == c as int
{
  ascii := c as int;
}

method AsciiValueTest(){
  var res1:= AsciiValue('A');
  print(res1);print("\n");
  assert res1==65;
  var res2:= AsciiValue('R');
  print(res2);print("\n");
  assert res2==82;
  var res3:= AsciiValue('S');
  print(res3);print("\n");
  assert res3==83;
}

method Main(){
  AsciiValueTest();
}

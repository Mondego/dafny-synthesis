method SquarePerimeter(side: int) returns (perimeter: int)
  requires side > 0
  ensures perimeter == 4 * side
{
  perimeter := 4 * side;
}


method SquarePerimeterTest(){
  var res1:= SquarePerimeter(10);
  print(res1);print("\n");
  assert res1==40;

  var res2:= SquarePerimeter(5);
  print(res2);print("\n");
  assert res2==20;

  var res3:= SquarePerimeter(4);
  print(res3);print("\n");
  assert res3==16;

}

method Main(){
  SquarePerimeterTest();
}
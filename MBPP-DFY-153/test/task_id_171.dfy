method PentagonPerimeter(side: int) returns (perimeter: int)
  requires side > 0
  ensures perimeter == 5 * side
{
  perimeter := 5 * side;
}

method PentagonPerimeterTest(){
  var res1:=PentagonPerimeter(5);
  print(res1); print("\n");
               //assert res1==25;
  var res2:=PentagonPerimeter(10);
  print(res2); print("\n");
               //assert res2==50;
  var res3:=PentagonPerimeter(15);
  print(res3); print("\n");
               //assert res3==75;

}

method Main(){
  PentagonPerimeterTest();
}
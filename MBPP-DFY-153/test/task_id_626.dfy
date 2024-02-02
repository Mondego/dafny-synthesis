method AreaOfLargestTriangleInSemicircle(radius: int) returns (area: int)
  requires radius > 0
  ensures area == radius * radius
{
  area := radius * radius;
}

method AreaOfLargestTriangleInSemicircleTest(){
  var res1:=AreaOfLargestTriangleInSemicircle(1);
  print(res1);print("\n");
              //assert res1==1;

  var res2:=AreaOfLargestTriangleInSemicircle(2);
  print(res2);print("\n");
              //assert res2==4;

  var res3:=AreaOfLargestTriangleInSemicircle(3);
  print(res3);print("\n");
              //assert res3==9;

}

method Main(){
  AreaOfLargestTriangleInSemicircleTest();
}

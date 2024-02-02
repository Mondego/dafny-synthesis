method LateralSurfaceArea(size: int) returns (area: int)
  requires size > 0
  ensures area == 4 * size * size
{
  area := 4 * size * size;
}

method LateralSurfaceAreaTest(){
  var res1:=LateralSurfaceArea(5);
  print(res1);print("\n");
              //assert res1==100;
  var res2:=LateralSurfaceArea(9);
  print(res2);print("\n");
              //assert res2==324;
  var res3:=LateralSurfaceArea(10);
  print(res3);print("\n");
              //assert res3==400;
}

method Main(){
  LateralSurfaceAreaTest();
}
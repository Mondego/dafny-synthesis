method CylinderSurfaceArea(radius: real, height: real) returns (area: real)
  requires radius > 0.0 && height > 0.0
  ensures area == 2.0 * 3.14159265358979323846 * radius * (radius + height)
{
  area := 2.0 * 3.14159265358979323846 * radius * (radius + height);
}

method CylinderSurfaceAreaTest(){

  var res1:=CylinderSurfaceArea(10.0,5.0);
  print(res1);print("\n");
              //assert res1==942.45;

  var res2:=CylinderSurfaceArea(4.0,5.0);
  print(res2);print("\n");
              //assert res2==226.18800000000002;


  var res3:=CylinderSurfaceArea(4.0,10.0);
  print(res3);print("\n");
              //assert res3==351.848;


}

method Main(){
  CylinderSurfaceAreaTest();
}

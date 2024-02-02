method SphereSurfaceArea(radius: real) returns (area: real)
  requires radius > 0.0
  ensures area == 4.0 * 3.14159265358979323846 * radius * radius
{
  area := 4.0 * 3.14159265358979323846 * radius * radius;
}

method SphereSurfaceAreaTest(){

  var res1:=SphereSurfaceArea(10.0);
  print(res1); print("\n");
               //assert res1==1256.6370614359173;
  var res2:=SphereSurfaceArea(15.0);
  print(res2); print("\n");
               //assert res2==2827.4333882308138;
  var res3:=SphereSurfaceArea(20.0);
  print(res3); print("\n");
               //assert res3==5026.548245743669;


}

method Main(){
  SphereSurfaceAreaTest();
}
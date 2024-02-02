method CubeSurfaceArea(size: int) returns (area: int)
  requires size > 0
  ensures area == 6 * size * size
{
  area := 6 * size * size;
}

method CubeSurfaceAreaTest(){

  var out1:=CubeSurfaceArea(5);
  print(out1);print("\n");
  assert out1==150;

  var out2:=CubeSurfaceArea(3);
  print(out2);print("\n");
  assert out2==54;

  var out3:=CubeSurfaceArea(10);
  print(out3);print("\n");
  assert out3==600;

}

method Main(){
  CubeSurfaceAreaTest();
}

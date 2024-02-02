method TriangularPrismVolume(base: int, height: int, length: int) returns (volume: int)
  requires base > 0
  requires height > 0
  requires length > 0
  ensures volume == (base * height * length) / 2
{
  volume := (base * height * length) / 2;
}

method TriangularPrismVolumeTest(){
  var out1:=TriangularPrismVolume(10,8,6);
  print(out1);print("\n");
  assert out1==240;

  var out2:=TriangularPrismVolume(3,2,2);
  print(out2);print("\n");
  assert out2==6;

  var out3:=TriangularPrismVolume(1,2,1);
  print(out3);print("\n");
  assert out3==1;

}
method Main(){
  TriangularPrismVolumeTest();
}
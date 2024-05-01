method CubeVolume(size: int) returns (volume: int)
  requires size > 0
  ensures volume == size * size * size
{
  volume := size * size * size;
}


method CubeVolumeTest(){
  
  var out1:=CubeVolume(3);
  expect out1==27;

  var out2:=CubeVolume(2);
  expect out2==8;

  var out3:=CubeVolume(5);
  expect out3==125;

}

method Main(){
  CubeVolumeTest();
}
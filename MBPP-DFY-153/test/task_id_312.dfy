method ConeVolume(radius: real, height: real) returns (volume: real)
  requires radius > 0.0 && height > 0.0
  ensures volume == (1.0/3.0) * (3.14159265358979323846) * radius * radius * height
{
  volume := (1.0/3.0) * (3.14159265358979323846) * radius * radius * height;
}

method ConeVolumeTest(){
  var res1:=ConeVolume(5.0,12.0);
  print(res1);print("\n");
              //assert res1==314.15926535897927;
  var res2:=ConeVolume(10.0,15.0);
  print(res2);print("\n");
              //assert res2==1570.7963267948965;
  var res3:=ConeVolume(19.0,17.0);
  print(res3);print("\n");
              //assert res3==6426.651371693521;

}

method Main(){
  ConeVolumeTest();
}
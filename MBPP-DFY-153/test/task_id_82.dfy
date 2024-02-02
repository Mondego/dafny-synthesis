method SphereVolume(radius: real) returns (volume: real)
  requires radius > 0.0
  ensures volume == (4.0/3.0) * (3.1415926535 * radius * radius * radius)
{
  volume := (4.0/3.0) * (3.1415926535 * radius * radius * radius);
}


method SphereVolumeTest(){

  var res1:=SphereVolume(10.0);
  print(res1); print("\n");
               //assert res1==4188.790204786391;

  var res2:=SphereVolume(25.0);
  print(res2); print("\n");
               //assert res2==65449.84694978735;

  var res3:=SphereVolume(20.0);
  print (res3); print("\n");
                //assert res3==33510.32163829113;


}

method Main(){
  SphereVolumeTest();
}

method CircleCircumference(radius: real) returns (circumference: real)
  requires radius > 0.0
  ensures circumference == 2.0 * 3.14159265358979323846 * radius
{
  circumference := 2.0 * 3.14159265358979323846 * radius;
}

method CircleCircumferenceTest(){
  var res1:=CircleCircumference(10.0);
  print(res1);print("\n");
              //assert res1==62.830000000000005;
  var res2:=CircleCircumference(5.0);
  print(res2);print("\n");
              //assert res2==31.415000000000003;
  var res3:=CircleCircumference(4.0);
  print(res3);print("\n");
              //assert res3==25.132;
}

method Main(){
  CircleCircumferenceTest();
}
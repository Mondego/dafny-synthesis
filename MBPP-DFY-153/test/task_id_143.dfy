method CountArrays(arrays: seq<array<int>>) returns (count: int)
  ensures count >= 0
  ensures count == |arrays|
{
  count := |arrays|;
}

method CountArraysTest(){

  var a1:= new int[][1,2,3,4];
  var a2:= new int[][5, 6, 7, 8];
  var s1:seq<array<int>> :=[a1,a2];
  var res1:=CountArrays(s1);
  expect res1==2;

  var a3:= new int[][1,2];
  var a4:= new int[][3,4];
  var a5:= new int[][5,6];
  var s2:seq<array<int>> :=[a3,a4,a5];
  var res2:=CountArrays(s2);
  expect res2==3;

  var a6:= new int[][1,2];
  var s3:seq<array<int>> :=[a6];
  var res3:=CountArrays(s3);
  expect res3==1;

}

method Main(){
  CountArraysTest();
}
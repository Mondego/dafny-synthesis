method CountIdenticalPositions(a: seq<int>, b: seq<int>, c: seq<int>) returns (count: int)
  requires |a| == |b| && |b| == |c|
  ensures count >= 0
  ensures count == | set i: int | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
{
  var identical := set i: int | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i];
  count := |identical|;
}

method CountIdenticalPositionsTest(){

  var s1: seq<int> := [1,2,3,4,5,6,7,8];
  var s2: seq<int> := [2,2,3,1,2,6,7,9];
  var s3: seq<int> := [2,1,3,1,2,6,7,9];
  var res1:=CountIdenticalPositions(s1,s2,s3);
  expect res1==3;

  var s4: seq<int> := [1,2,3,4,5,6,7,8];
  var s5: seq<int> := [2,2,3,1,2,6,7,8];
  var s6: seq<int> := [2,1,3,1,2,6,7,8];
  var res2:=CountIdenticalPositions(s4,s4,s6);
  expect res2==4;

  var s7: seq<int> := [1,2,3,4,2,6,7,8];
  var s8: seq<int> := [2,2,3,1,2,6,7,8];
  var s9: seq<int> := [2,1,3,1,2,6,7,8];
  var res3:=CountIdenticalPositions(s7,s8,s9);
  expect res3==5;

}

method Main(){
  CountIdenticalPositionsTest();
}
method ElementWiseDivide(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  requires forall i :: 0 <= i < |b| ==> b[i] != 0
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
{
  result := [];
  for i := 0 to |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] / b[k]
  {
    result := result + [a[i] / b[i]];
  }
}

method ElementWiseDivideTest(){
  var s1: seq<int> := [4,5,6];
  var s2: seq<int> := [1, 2, 3];
  var res1:=ElementWiseDivide(s1,s2);
  print(res1);print("\n");
              //expected [4, 2, 2]

  var s3: seq<int> := [3,4];
  var s4: seq<int> := [3,2];
  var res2:=ElementWiseDivide(s3,s4);
  print(res2);print("\n");
              //expected [1, 2]


  var s5: seq<int> := [90,120];
  var s6: seq<int> := [30,20];
  var res3:=ElementWiseDivide(s5,s6);
  print(res3);print("\n");
              //expected [3, 6]



}

method Main(){
  ElementWiseDivideTest();
}

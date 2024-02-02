method MultiplyElements(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
{
  result := [];
  var i := 0;
  while i < |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] * b[k]
  {
    result := result + [a[i] * b[i]];
    i := i + 1;
  }
}


method MultiplyElementsTest(){

  var s1:seq<int> :=[1, 3,4, 5, 2, 9, 1, 10];
  var s2:seq<int> :=[6, 7, 3, 9, 1, 1, 7, 3];
  var res1:=MultiplyElements(s1,s2);
  print(res1);print("\n");
              //expected [6, 21, 12, 45, 2, 9, 7, 30]

  var s3:seq<int> :=[2, 4,5, 6, 3, 10, 2, 11];
  var s4:seq<int> :=[7, 8, 4, 10, 2, 2, 8, 4];
  var res2:=MultiplyElements(s3,s4);
  print(res2);print("\n");
              //expected [14, 31, 20, 60, 6, 20, 16, 44]

  var s5:seq<int> :=[3, 5, 6, 7, 4, 11, 3, 12];
  var s6:seq<int> :=[8, 9, 5, 11, 3, 3, 9, 5];
  var res3:=MultiplyElements(s5,s6);
  print(res3);print("\n");
              //expected [24, 45, 30, 77, 12, 33, 27, 60]

}

method Main(){
  MultiplyElementsTest();
}


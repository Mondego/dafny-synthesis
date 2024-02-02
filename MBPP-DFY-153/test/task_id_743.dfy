method RotateRight(l: seq<int>, n: int) returns (r: seq<int>)
  requires n >= 0
  ensures |r| == |l|
  ensures forall i :: 0 <= i < |l| ==> r[i] == l[(i - n + |l|) % |l|]
{
  var rotated: seq<int> := [];
  for i := 0 to |l|
    invariant 0 <= i <= |l|
    invariant |rotated| == i
    invariant forall k :: 0 <= k < i ==> rotated[k] == l[(k - n + |l|) % |l|]
  {
    rotated := rotated + [l[(i - n + |l|) % |l|]];
  }
  return rotated;
}


method RotateRightTest(){
  var a1:seq<int>:= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res1:=RotateRight(a1,3);
  print(res1);print("\n");
              //expected [8, 9, 10, 1, 2, 3, 4, 5, 6, 7]


  var a2:seq<int>:= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res2:=RotateRight(a2,2);
  print(res2);print("\n");
              //expected [9, 10, 1, 2, 3, 4, 5, 6, 7, 8]


  var a3:seq<int>:= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res3:=RotateRight(a3,5);
  print(res3);print("\n");
              //expected [6, 7, 8, 9, 10, 1, 2, 3, 4, 5]


}

method Main(){
  RotateRightTest();
}

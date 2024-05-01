method SmallestListLength(s: seq<seq<int>>) returns (v: int)
  requires |s| > 0
  ensures forall i :: 0 <= i < |s| ==> v <= |s[i]|
  ensures exists i :: 0 <= i < |s| && v == |s[i]|
{
  v := |s[0]|;
  for i := 1 to |s|
    invariant 0 <= i <= |s|
    invariant forall k :: 0 <= k < i ==> v <= |s[k]|
    invariant exists k :: 0 <= k < i && v == |s[k]|
  {
    if |s[i]| < v
    {
      v := |s[i]|;
    }
  }
}

method SmallestListLengthTest(){
  
  var s1:seq<seq<int>> :=[[1],[1,2]];
  var res1:=SmallestListLength(s1);
  expect res1==1;

  var s2:seq<seq<int>> :=[[1,2],[1,2,3],[1,2,3,4]];
  var res2:=SmallestListLength(s2);
  expect res2==2;

  var s3:seq<seq<int>> :=[[3,3,3],[4,4,4,4]];
  var res3:=SmallestListLength(s3);
  expect res3==3;


}

method Main(){
  SmallestListLengthTest();
}
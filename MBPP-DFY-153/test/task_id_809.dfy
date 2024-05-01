method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
  requires |a| == |b|
  ensures result <==> forall i :: 0 <= i < |a| ==> a[i] > b[i]
  ensures !result <==> exists i :: 0 <= i < |a| && a[i] <= b[i]
{
  result := true;
  for i := 0 to |a|
    invariant 0 <= i <= |a|
    invariant result <==> forall k :: 0 <= k < i ==> a[k] > b[k]
    invariant !result <==> exists k :: 0 <= k < i && a[k] <= b[k]
  {
    if a[i] <= b[i]
    {
      result := false;
      break;
    }
  }
}

method IsSmallerTest(){

  var s1: seq<int> := [1, 2, 3];
  var s2: seq<int> := [2, 3, 4];
  var res1:=IsSmaller(s1,s2);
  expect res1==false;

  var s3: seq<int> := [4, 5, 6];
  var s4: seq<int> := [3, 4, 5];
  var res2:=IsSmaller(s3,s4);
  expect res2==true;

  var s5: seq<int> := [11, 12, 13];
  var s6: seq<int> := [10, 11, 12];
  var res3:=IsSmaller(s5,s6);
  expect res3==true;

}

method Main(){
  IsSmallerTest();
}

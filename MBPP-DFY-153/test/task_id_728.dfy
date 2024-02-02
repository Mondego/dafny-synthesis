method AddLists(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
{
  result := [];
  for i := 0 to |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] + b[k]
  {
    result := result + [a[i] + b[i]];
  }
}

method AddListsTest(){
  var a1:seq<int>:=[10,20,30];
  var a2:seq<int>:= [15,25,35];
  var res1:=AddLists(a1,a2);
  print(res1);print("\n");
              //expected  [25,45,65]

  var a3:seq<int>:= [1,2,3];
  var a4:seq<int>:= [5,6,7];
  var res2:=AddLists(a3,a4);
  print(res2);print("\n");
              //expected [6,8,10]

  var a5:seq<int>:= [15,20,30];
  var a6:seq<int>:= [15,45,75];
  var res3:=AddLists(a5,a6);
  print(res3);print("\n");
              //expected [30,65,105];

}

method Main(){
  AddListsTest();
}
